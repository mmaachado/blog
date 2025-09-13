+++
date = '2025-07-14T12:31:07-03:00'
draft = true
title = 'Zed (draft)'
tags = ["IDE", "Zed"]
+++

Desde que comecei a estudar programação, uma das coisas que mais me tirava a atenção eram as IDEs. Atualmente, a IDE que mais utilizei foi o VSCode, mas, por motivos de privacidade e interesse pessoal, comecei uma busca por um novo editor de texto.

Quando comecei a desenvolver, não fazia a menor ideia do que deveria ser uma IDE achava que era apenas um editor de texto aprimorado para programação — *de certa forma, estava certo*. Passei por diversas IDEs e editores no início, como **Atom**, **Visual Studio**, **Eclipse**, **Xcode**, **PyCharm**, até me estabilizar no **VSCode**.

Quando iniciei a migração para o Debian, decidi testar o **Emacs** devido à dificuldade de instalar o VSCode na distribuição. Embora eu tenha gostado muito do software, a necessidade de parar para aprender e customizar praticamente tudo do zero foi um obstáculo, principalmente porque, mesmo após configurado, ainda encontrava problemas ao escrever código Python, HTML ou Markdown — *como a ausência de indentação automática ou a falta de funcionalidades às quais o VSCode me viciou, como a exibição de documentação ao passar o mouse sobre uma função, debugger nativo...*. O Emacs se tornou um dos meus editores favoritos, mas hoje o utilizo mais por nostalgia. Para produtividade e quando estava utilizando o Windows, ainda optava pela velocidade do VSCode.

Nos últimos tempos, comecei a me preocupar mais com privacidade. Em meio a migrações de sistemas operacionais e configurações de redes sociais, também passou a me incomodar o fato de a minha IDE enviar dados de uso para servidores da Microsoft. Mesmo que essas informações sejam, em tese, irrelevantes, ainda assim são **meus** dados.

Foi então que, cerca de dois anos atrás, comecei a alternar entre IDEs e editores: retornei ao Emacs, depois ao VSCode, experimentei Vim, Neovim, LazyVim, e acabava sempre voltando ao VSCode. Pensei em usar o VSCodium (build do VSCode sem telemetria) ou até criar um fork funcional do Atom, mas o esforço e as dificuldades seriam grandes. Até que encontrei o Zed. Decidi testá-lo uma, duas, três vezes, até que aprendi os conceitos básicos, configurei-o ao meu gosto e, finalmente, parece que encontrei minha IDE definitiva.

Com pouco mais de uma semana de uso, consegui configurar o Zed de forma semelhante ao VSCode, facilitando minha migração. A principal vantagem, para mim, é que ele já vem com suporte embutido a linguagens modernas como Python via Language Servers, sem a necessidade de instalar plugins de terceiros.

O único ponto que ainda me incomoda é a edição de arquivos Markdown. Como escrevo muito nesse formato, a formatação nativa do Zed às vezes atrasa meu fluxo: colocar texto em **negrito** ou _itálico_ exige inserir os caracteres manualmente. Atalhos como `Ctrl+B` ou `Ctrl+I` (ou variações como `Ctrl+*`) não funcionam no Zed — *ou, pelo menos, ainda não descobri como configurá-los*.

São pontos triviais. Acredito que sejam corrigidos em atualizações futuras, ou que eventualmente eu descubra como configurar essas funcionalidades adequadamente.

## config.json

Aqui um exemplo dos meus arquivos de configuração do Zed, separado por tópicos e em alguns casos, comentados para explicar cada 