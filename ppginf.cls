%------------------------------------------------------------------------------

% EM USO NORMAL, ESTE ARQUIVO NÃO DEVE SER MODIFICADO!

% Esta classe "tese" define o padrão para dissertações, teses e documentos
% correlatos produzidos no Programa de Pós-Graduação em Informática da
% Universidade Federal do Paraná, em Curitiba PR.
%
% Esta classe segue o modelo da classe "book" e aceita todas as suas opções.
% Ela também define as seguintes opções específicas:
% 
%    defesa: versão prévia (só frente, espaçamento 1.5,)
%    final:  versão final (frente/verso, espaçamento 1, páginas complementares)

% Os seguintes ambientes e comandos também são definidos:
%
% \descr{...}		: descrição do documento na folha de rosto
% \instit{short}{long}	: instituição (abreviado e por extenso)
% \advisor{Nome}	: define o orientador
% \coadvisor{Nome}	: define o co-orientador, se houver
% \field{Área}		: define a área de concentração da pesquisa
% \local{Cidade}	: define o local da defesa
% \keywords{}{}...	: define três palavras-chave e três keywords
% \begin{resumo}	: define a página de resumo
% \begin{abstract}	: define a página de abstract
% \begin{agradece}	: define a página de agradecimentos
% \begin{dedica}	: define a página de dedicatória
% \begin{ficha}		: define a ficha catalográfica
% \begin{aprovacao}	: define a folha de aprovação
%
% Software fornecido sob a licença GNU GPL. Pode ser usada e modificada
% livremente, desde que mantidas as informações deste cabeçalho.
%
% Histórico:
%
% 2007/06/01 V0.1
% - versão inicial, por Carlos Maziero (maziero@ppgia.pucpr.br). 
%
% 2007/06/15
% - comando \keywords
% - mais comentários explicativos
% - ajustes para evitar linhas órfãs e viúvas
%
% 2007/08/08 V0.2
% - mudei fontenc para T1, para acertar acentos no PDF
% - mudei package de "txfonts" para "times"
%
% 2007/08/08 V0.3
% - coloquei flag -tA4 no dvips (Makefile e instruções de uso)
%
% 2007/09/02 V0.4
% - listasimb e listabrev
% - resumo, abstract e agradecimentos em negrito
%
% 2008/03/12 V0.5
% - ajustei a ordem das paginas iniciais (resumo, sumário, etc)
%
% 2008/06/03 V0.6
% - substituição do Makefile pelo script build (mais completo)
% - inclusão da opção "final" para gerar a versão final
% - estilo "apalike" para bibliografia
%
% 2008/06/11 V0.7
% - inclusão automatica da ficha catalográfica, agradecimentos
%   e dedicatória na versão final do documento
% - ficha catalográfica no verso da segunda capa
%
% 2008/07/16 V0.8
% - removidos packages obsoletos (vide documento l2tabuen.pdf)
% - dimensões da página definidas com package "geometry"
% - espaçamento: troca de \baselinestretch por \linespread
% - indentação de parágrafo mudou de 12.7mm para 4em
% - trocados \bf e \sc por \textbf e \textsc
% - adotado o package setspace para espaçamento entre linhas
% - linhas do título mais espaçadas sempre, mesmo no modo "final"
% - fontes ajustados para o padrão LaTeX2e
% - ajustada fonte default do package listings para tt footnotesize
% - retirados alguns acentos ISO deste arquivo (compatibilidade UTF8)
% - acentos \'i modificados para \'{\i}
%
% 2008/11/17 V0.9
% - opções "draft" e "final" conflitam com opções de documentclass, 
%   opçõo "draft" vira default e opção "final" renomeada para "aprovada"
% - corrigida ortografia errada em "Abreviações"
%
% 2009/06/03 V0.9.1
% - incluso exemplo de citação bibliográfica contendo URL
% - ajustes no texto do modelo Cap 1 e 2
%
% 2014/03/18 V0.9.2
% - versão para o PPGCA/UTFPR
% - adicionada opção "defesa"
% - reorganização do texto dos capítulos de exemplo
%
% 2015/11/30 V0.9.3
% - versão para o PPGINF/UFPR
% - todos os arquivos em UTF8
% - descrição genérica, ajustável para qualquer tipo de monografia
% - usuário pode optar oneside/twoside
% - usuário pode escolher formato de bibliografia
% - reorganização dos arquivos em diretórios
% - criação de Makefile mínimo
% - pacote ifthen substituido por comandos TeX
% - ajustes para ficar mais próximo do formato da Bib UFPR (pero no mucho)
% - opções do pacote listings ajustadas para aceitar UTF8

% Ainda por fazer:
% - melhorar lista de símbolos e abreviações (usar package para listas)
% - automatizar geração da ficha catalográfica
% - ajustes para permitir documento em inglês
% - traduzir o modelo de bibliografia apalike
% - usar o modelo de bibliografia natbib (\citep e \citet)

%------------------------------------------------------------------------------

% definição da classe
\ProvidesClass{ppginf}[2015/11/30 V0.9.3 (Carlos Maziero)]

%------------------------------------------------------------------------------

% opções desta classe

% define flag de versão final do documento
\newif\iffinalmode

% defesa: só frente, espaçamento 1,5 e menos páginas iniciais
\DeclareOption{defesa}{\finalmodefalse}

% aprovada: frente/verso, espaçamento 1 e mais páginas iniciais
\DeclareOption{final}{\finalmodetrue}

% demais opções devem ser encaminhadas à classe de base (book)
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% processa as opcoes definidas acima
\ProcessOptions

%------------------------------------------------------------------------------

%% Carregar a classe de base
\iffinalmode
  \if@twoside
    \LoadClass[12pt,a4paper,twoside]{book}	% twoside na final
  \else%
    \LoadClass[12pt,a4paper,oneside]{book}	% oneside na final
  \fi
\else
  \if@twoside
    \LoadClass[12pt,a4paper,twoside]{book}	% twoside na defesa
  \else%
    \LoadClass[12pt,a4paper,oneside]{book}	% oneside na defesa
  \fi
\fi

%------------------------------------------------------------------------------

%% Ajustes no layout geral do texto

% dimensões da página e margens
\RequirePackage{geometry}
\geometry{a4paper}
\geometry{right=2cm,left=2cm,top=3cm,bottom=2cm}
\geometry{bindingoffset=1cm}

% indentar o primeiro parágrafo (português)
\RequirePackage{indentfirst}

% indentação dos parágrafos é 10mm
\setlength{\parindent}{15mm}

% aumentar o espaço entre a legenda e a tabela
\usepackage{caption} 
\captionsetup[table]{skip=10pt}

% espaçamento entre linhas
\RequirePackage{setspace}

\iffinalmode
  % final: espaçamento 1
  \singlespacing
\else
  % default: espaçamento 1.5
  \onehalfspacing
\fi

% relaxar o espaçamento entre caracteres
\sloppy

% impedir linhas órfãs/viúvas (linhas isoladas no início/fim de uma página)
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty 10000
\raggedbottom

% sumário: adiciona entrada para bibliografia e remove entradas
% de sumário, lista de figuras e lista de tabelas.
\RequirePackage[nottoc,notlot,notlof]{tocbibind}

% melhor formatação de URLs na bibliografia
\RequirePackage[obeyspaces]{url}

%------------------------------------------------------------------------------

% formatação de cabeçalho e rodapé
\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}

% sem linhas separadoras para cabeçalho e rodapé
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% estilo de página para prâmbulo (páginas iniciais) do documento
\fancypagestyle{frontmatter}{
  \fancyhf{}
}

% redefine o estilo default "plain" para nulo
\fancypagestyle{plain}{
  \fancyhf{}
}

% redefine o estilo de página para o corpo do documento
\fancypagestyle{mainmatter}{
  \fancyhf{}
  \if@twoside
    \fancyhead[LE,RO]{\thepage}
  \else
    \fancyhead[R]{\thepage}
  \fi
}

%------------------------------------------------------------------------------

% pacotes para gerar um arquivo PDF "rico" (bookmarks, links, metadados)
\RequirePackage[plainpages,pdfpagelabels]{hyperref} % PDF com links, metadados
\RequirePackage{bookmark}		% cria um índice no PDF

% ajustar metadados e propriedades do PDF gerado
\hypersetup{
  % pdftitle, author, etc definidos mais abaixo
%  bookmarks   = true,
%  pageanchor  = false,
  hypertexnames = false,
%  bookmarkstype = page,
  pdfview     = Fit,
  pdfborder   = {0 0 0},
  colorlinks  = false,
  linkcolor   = blue,
  anchorcolor = blue,
  citecolor   = blue,
  filecolor   = blue,
%  pagecolor   = blue,
  urlcolor    = blue
}

\RequirePackage{microtype}	% melhorar a qualidade da tipografia no PDF

%------------------------------------------------------------------------------

% definição de autor, orientador, local, área, palavras-chave, etc

% valores default (não mudá-los, pois poderão ser testados em macros)
\def\@advisor{}			% orientador
\def\@coadvisor{}		% co-orientador
\def\@field{}			% área de concentração
\def\@local{}			% local
\def\@descr{}			% descrição do documento
\def\@instshort{undef}		% instituição (abreviação)
\def\@instlong{undef}		% instituição (por extenso)
\def\@pcs{undef}		% palavras-chave
\def\@kws{undef}		% keywords

% instituição
\newcommand{\instit}[2]{
  \def\@instshort{#1}
  \def\@instlong{#2}
}

% descrição do documento na folha de rosto
\newcommand{\descr}[1]{\def\@descr{#1}}

% orientadores
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\coadvisor}[1]{\def\@coadvisor{#1}}

% área/tema do texto
\newcommand{\field}[1]{\def\@field{#1}}

% local (cidade)
\newcommand{\local}[1]{\def\@local{#1}}

% palavras-chave em português e inglês
\newcommand{\pchave}[1]{\def\@pcs{#1}}
\newcommand{\keyword}[1]{\def\@kws{#1}}

%------------------------------------------------------------------------------

% ambientes da parte inicial do documento

% resumo
\newenvironment{resumo}
{
  \clearpage
%  \phantomsection
%  \addcontentsline{toc}{chapter}{Resumo}
  \begin{center}
  {\huge\textbf{Resumo}}
  \end{center}
  \vspace{0.5ex}
}{
  \vspace{4ex}
  \noindent\textbf{Palavras-chave:} {\@pcs}.
  \vfill
  \cleardoublepage
}

% abstract
\newenvironment{abstract}
{
  \clearpage
%  \phantomsection
%  \addcontentsline{toc}{chapter}{Abstract}
  \begin{center}
  {\huge\textbf{Abstract}}
  \end{center}
  \vspace{0.5ex}
}{
  \vspace{4ex}
  \noindent\textbf{Keywords:} {\@kws}.
  \vfill
  \cleardoublepage
}

% agradecimentos e dedicatória (só na versão aprovada)
\iffinalmode
  % ambiente da ficha catalográfica
  \newenvironment{ficha}{}{\cleardoublepage}

  % ambiente da folha de aprovação
  \newenvironment{aprovacao}{}{\cleardoublepage}

  % ambiente de agradecimentos
  \newenvironment{agradece}
  {
    \begin{center}
    {\huge\textbf{Agradecimentos}}
    \end{center}
    \vspace{0.5ex}
  }{
    \vfill
    \cleardoublepage
  }

  % ambiente de dedicatória
  \newenvironment{dedica}
  {
    \vspace*{\fill}
    \hfill
    \begin{minipage}[t]{6cm}
    \em
  }{
    \end{minipage}
    \cleardoublepage
  }
\else
  % Na versão de defesa, esses ambientes não geram nada
  \newenvironment{ficha}{\comment}{\endcomment}
  \newenvironment{agradece}{\comment}{\endcomment}
  \newenvironment{dedica}{\comment}{\endcomment}
  \newenvironment{aprovacao}{\comment}{\endcomment}
\fi

% lista de acrônimos (siglas e abreviações)
\newenvironment{listaacron}
{
  \chapter*{Lista de Acr\^onimos}
%  \phantomsection
%  \addcontentsline{toc}{chapter}{Lista de Acr\^onimos}
}{
  \vfill
  \cleardoublepage
}

% lista de símbolos
\newenvironment{listasimb}
{
  \chapter*{Lista de S\'imbolos}
%  \phantomsection
%  \addcontentsline{toc}{chapter}{Lista de S\'{\i}mbolos}
}{
  \vfill
  \cleardoublepage
}

%------------------------------------------------------------------------------

% construção das páginas iniciais
\renewcommand{\titlepage}
{
  % páginas iniciais não são numeradas
  %\pagestyle{empty}
  %\thispagestyle{empty}

  % ajustar tags do PDF final
  \hypersetup{
    pdftitle    = {\@title},
    pdfauthor   = {\@author},
    pdfsubject  = {\@field},
    pdfproducer = {\@instshort\ - \@instlong},
    pdfkeywords = {\@pcs, \@kws}
  }

  % primeira capa (só na versão aprovada)
  \iffinalmode
%    \phantomsection
%    \thispagestyle{empty}
    \begin{center}
      \begin{doublespace}
        \textsc{\Large\@instlong}
        \\
        \vspace{3cm}
        \textsc{\Large\@author}
        \\
        \vfill
        \textsc{\Large\@title}
        \vfill
        \textsc{\Large\@local\\\@date}
      \end{doublespace}
    \end{center}
    \cleardoublepage
  \fi

  % folha de rosto
  \clearpage
%  \phantomsection
%  \addcontentsline{toc}{chapter}{Rosto}
%  \thispagestyle{empty}

  % autor
  \begin{center}
    \textsc{\Large\@author}
  \end{center}

  \vfill\vfill

  % título
  \begin{center}
    \begin{doublespace}
      \textsc{\Large\@title}
    \end{doublespace}
  \end{center}

  \vspace{1cm}

  % selo descritivo
  \hfill
  \begin{minipage}{9cm}

    % descrição
    \@descr.

    % área de concentração
    \ifx\@field\@empty
    \else
      \vspace{1em}
      \'Area de concentra\c{c}\~ao: \emph{\@field}.
    \fi

    % orientador
    \ifx\@advisor\@empty
    \else
      \vspace{1em}
      Orientador: \@advisor.
    \fi

    % coorientador
    \ifx\@coadvisor\@empty
    \else
      \vspace{1em}
      Co-orientador: \@coadvisor.
    \fi

  \end{minipage}

  \vfill

  % local e data
  \begin{center}
    \begin{doublespace}
      \textsc{\Large\@local\\\@date}
    \end{doublespace}
  \end{center}

  % that's all, folks!
  \cleardoublepage
}

%------------------------------------------------------------------------------
