/*
    Sumário: marcação da seção em leitura.

    Substitui themes/poison/assets/js/toc.js. O tema carrega o arquivo por
    resources.Get "js/toc.js", e o assets/ do projeto tem precedência sobre
    o do tema, então basta existir aqui — themes/ fica intacto.

    O original guardava como seção ativa o último título do lote entregue
    pelo IntersectionObserver que estivesse visível. Títulos próximos entram
    na tela juntos, e o de baixo ganhava: clicar em "2." marcava "2.2". Como
    só reagia a título visível, o destaque também congelava no meio de uma
    seção longa, quando nenhum título está na tela.

    Aqui a seção ativa é a última cujo título já passou da linha de leitura,
    logo abaixo do topo da janela. É a mesma conta a cada quadro, sem
    depender da ordem em que o navegador entrega os eventos.

    Detalhe do tema que decide a implementação: a janela não rola. O layout
    é um flex de altura fixa e quem tem overflow-y é .container.content, de
    modo que window.scrollY é sempre 0 e o evento de rolagem não chega em
    window. O elemento que rola é descoberto subindo a partir do post.
*/

(function () {
  "use strict";

  // Distância do topo da janela que conta como linha de leitura. Precisa
  // caber entre dois títulos vizinhos: a âncora deixa o título clicado em
  // 0, e a linha não pode alcançar o título seguinte. O menor intervalo
  // observado nos posts é de 82px, com um título logo abaixo do outro.
  var LINHA_DE_LEITURA = 48;

  function acharRolagem(elemento) {
    for (var no = elemento; no && no !== document.body; no = no.parentElement) {
      var overflow = getComputedStyle(no).overflowY;
      if (
        (overflow === "auto" || overflow === "scroll") &&
        no.scrollHeight > no.clientHeight + 1
      ) {
        return no;
      }
    }
    return null; // a própria janela
  }

  function iniciar() {
    var nav = document.querySelector("nav#TableOfContents");
    var post = document.querySelector(".post");
    if (!nav || !post) {
      return;
    }

    // Só entram os títulos que o sumário lista de fato: startLevel e
    // endLevel do hugo.toml podem deixar um título de fora, e aí não há
    // <li> para marcar. Daí partir dos links, e não dos títulos.
    var itens = [];
    Array.prototype.forEach.call(
      nav.querySelectorAll('li > a[href^="#"]'),
      function (link) {
        var alvo = link.getAttribute("href").slice(1);
        var id;
        try {
          id = decodeURIComponent(alvo);
        } catch (erro) {
          id = alvo;
        }
        var titulo = id ? document.getElementById(id) : null;
        if (titulo && post.contains(titulo)) {
          itens.push({ titulo: titulo, li: link.parentElement });
        }
      }
    );

    if (!itens.length) {
      return;
    }

    var rolagem = acharRolagem(post);
    var ouvinte = rolagem || window;
    var caixaDoSumario = acharRolagem(nav);
    var ativo = null;
    var fixado = null;
    var agendado = false;

    function noFim() {
      if (rolagem) {
        return (
          rolagem.scrollTop + rolagem.clientHeight >= rolagem.scrollHeight - 2
        );
      }
      return (
        window.scrollY + window.innerHeight >=
        document.documentElement.scrollHeight - 2
      );
    }

    function emLeitura() {
      // Perto do fim as últimas seções podem nunca alcançar a linha de
      // leitura, porque não sobrou rolagem. Aí vale a última.
      if (noFim()) {
        return itens[itens.length - 1];
      }
      var escolhido = itens[0];
      for (var i = 0; i < itens.length; i++) {
        if (itens[i].titulo.getBoundingClientRect().top <= LINHA_DE_LEITURA) {
          escolhido = itens[i];
        } else {
          break;
        }
      }
      return escolhido;
    }

    function marcar(item) {
      if (item === ativo) {
        return;
      }
      ativo = item;
      itens.forEach(function (outro) {
        var atual = outro === item;
        outro.li.classList.toggle("active", atual);
        outro.li.classList.toggle("inactive", !atual);
      });
      revelar(item);
    }

    // Sumário longo rola por dentro, então a seção marcada pode estar fora da
    // faixa visível. A conta é feita na mão, e não com scrollIntoView, que
    // também mexeria em quem rola acima — aqui só a caixa do sumário anda, e
    // só quando a entrada já saiu da vista.
    function revelar(item) {
      if (!caixaDoSumario) {
        return;
      }
      var caixa = caixaDoSumario.getBoundingClientRect();
      var entrada = item.li.getBoundingClientRect();
      var folga = 16;
      if (entrada.top < caixa.top + folga) {
        caixaDoSumario.scrollTop -= caixa.top + folga - entrada.top;
      } else if (entrada.bottom > caixa.bottom - folga) {
        caixaDoSumario.scrollTop += entrada.bottom - (caixa.bottom - folga);
      }
    }

    function atualizar() {
      agendado = false;
      marcar(fixado || emLeitura());
    }

    function agendar() {
      if (!agendado) {
        agendado = true;
        window.requestAnimationFrame(atualizar);
      }
    }

    // Clique no sumário: a seção pedida é a que o leitor quer, mesmo que a
    // âncora pare a poucos pixels do título seguinte. A fixação cai assim
    // que a conta voltar a concordar com o clique.
    nav.addEventListener("click", function (evento) {
      var link = evento.target.closest('li > a[href^="#"]');
      if (!link) {
        return;
      }
      for (var i = 0; i < itens.length; i++) {
        if (itens[i].li === link.parentElement) {
          fixado = itens[i];
          marcar(fixado);
          break;
        }
      }
    });

    ouvinte.addEventListener(
      "scroll",
      function () {
        if (fixado && emLeitura() === fixado) {
          fixado = null;
        }
        agendar();
      },
      { passive: true }
    );

    window.addEventListener("resize", agendar, { passive: true });
    window.addEventListener("hashchange", agendar);

    atualizar();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", iniciar);
  } else {
    iniciar();
  }
})();
