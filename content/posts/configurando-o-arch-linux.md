+++
date = '2025-09-21T22:04:12-03:00'
draft = true
title = 'Configurando o Arch Linux (draft)'
+++

## Introdução

Já faz algum tempo que esse post está em meus `drafts` (aproximadamente desde *22/05/2025* às *09h57*). Lembro que tinha acabado de chegar no escritório, sentei na minha mesa e iniciei a escrever o que era praticamente um guia, nele linkei os principais tópicos que achei interessante testar na minha nova máquina.

Havia acabado de decidir comprar meu primeiro notebook para uso pessoal e estava mapeando todas as configurações que eu julgava importante, e que eu lembrava naquele momento. Além do uso para meus estudos e jogos, também queria estudar como o Linux funcionava em nossos notebooks, para quem sabe, futuramente conseguir solucionar alguns problemas e fornecer algum suporte.

O notebook que escolhi foi o **Storm 450r**, com uma combinação de **Ryzen 77435HS** e **RTX 4050 com 6GB de VRAM**. O hardware mais potente que já tive até o momento. Memória optei pelos **16GB**, pois menos que isso é praticamente inviável, e para armazenamento economizei com os **256GB de NVMe**, afinal, já tinha um outro NVMe que iria utilizar, então aproveitei esse que viria com o notebook para fazer o dual boot com o Windows 11 para minha noiva utilizar.

## Ajustes inicias

Após instalado o Arch com a DE de preferência (optei pelo KDE/Plasma), é recomendado realizar algumas instalações e configurações no sistema.

### 1.1. Ajustar o pacman

Abra o arquivo `pacman.conf` com o **nano**:

```
 # nano /etc/pacman.conf
```

Descomente a linha `Color`, altere o valor de `ParallelDownloads=10` e claro, insira `ILoveCandy` logo abaixo. Seu arquivo deve ficar parecido com o meu:

```
# Misc options
#UseSyslog
Color
#NoProgressBar
CheckSpace
#VerbosePkgLists
ParallelDownloads = 10
DownloadUser = alpm
#DisableSandbox
ILoveCandy
```

Esses ajustes fazem as seguintes ações:

- **Color**: Libera as cores nos comandos do terminal;
- **ParallelDownloads=10**: Aumenta a capacidade de download de pacotes em paralelo para 10;
- **ILoveCandy**: Altera a visualização do indicador de porcentagem dos downloads, simulando o jogo Pacman;

Agora você pode salvar essas alterações e fechar o arquivo.

### 1.2. mirrorlist

Durante a instalação, provavelmente você selecionou uma mirrorlist. Por padrão, eu sempre escolho a mirror worldwide, mas, após a instalação, executo essas etapas abaixo para ter a mirror mais rápida para baixar meus pacotes:

Instale o pacote reflector:
```
$ sudo pacman -S reflector
```

Crie um backup da sua mirrorlist padrão:
```
$ sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Atualize a mirrorlist com os melhores mirrors:
```
$ sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```
> Basicamente o que esse comando faz:
>
> *--verbose*: Retorna no terminal cada etapa do comando;
>
> *--latest 10*: Busca os 10 mais recentes;
>
> *--protocol https*: Filtra para retornar apenas mirrors com o protocolo https;
>
> *--sort rate*: Classifica os mirrors pela melhor posição deles;
>
> *--save*: Salva os resultados em um arquivo;

> Obs.: É interessante executar esse comando regularmente, as vezes um mirror pode estar em manutenção ou simplesmente fora do ar.
>
> Assim você evita de misteriosamente não conseguir mais atualizar o seu sistema ou instalar um pacote.

### 1.3. microcode

Após configurado o pacman e o mirrorlist, é interessante atualizar o microcode do processador para a versão mais atual disponível. Embora, muito provavelmente esse processo já seja realizado na instalação do sistema, é interessante baixar esse pacote para garantir a instalações de novas versões futuramente:

```
$ sudo pacman -S amd-ucode
```
> Meu processador é AMD, se o seu for Intel, basta alterar para: intel-ucode.

### 1.4. Pacotes Adicionais

Essa etapa varia muito de gosto para gosto, mas eu acho essencial fazer a instalação da maioria destes pacotes, principalmente das fontes.

```
$ sudo pacman -S git firefox ttf-dejavu noto-fonts-extra ttf-bitstream-vera noto-fonts noto-fonts-emoji ttf-droid ttf-fira-mono ttf-liberation ttf-opensans ttf-roboto gnupg global base-devel curl rsync wget zip unzip man net-tools dnsutils
```

### Extras

Além destas configurações, também gosto de instalar o [Starship.rs](https://starship.rs/guide/) para customizar o terminal e o [yay](https://github.com/Jguer/yay) para permitir instalar pacotes do [AUR](https://aur.archlinux.org/).

## Configurando os Snapshots

## Backup dos dados no Drive

## UI com Catppuccin
