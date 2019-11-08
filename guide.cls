\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guide}

\let\@author\@empty

\LoadClassWithOptions{article}

\RequirePackage[table]{xcolor}
\RequirePackage[dutch]{babel}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[a4paper, textwidth=6.5in, textheight=8.5in, top=5cm, marginparsep=7pt, marginparwidth=.6in]{geometry}

\definecolor{bannerColour}{rgb}{0.46,0.31,0.48}
\def\bannerColour{bannerColour}

\RequirePackage[unicode, bookmarks, colorlinks, breaklinks, urlcolor=bannerColour, pdfusetitle]{hyperref}
\RequirePackage{fontspec,xunicode,eso-pic,graphicx,caption,titlesec,eurosym,listings,tikz}

\setlength\parindent{0in}
\defaultfontfeatures{Mapping=tex-text}

\setromanfont[Extension = .ttf, Path=fonts/, BoldFont=NunitoSans-Bold, ItalicFont=NunitoSans-LightItalic, BoldItalicFont=NunitoSans-BoldItalic]{NunitoSans-Light}
\setsansfont[Extension = .ttf, Path=fonts/, BoldFont=NunitoSans-Bold, ItalicFont=NunitoSans-LightItalic, BoldItalicFont=NunitoSans-BoldItalic]{NunitoSans-Light}
\setmonofont[Extension = .ttf, Path=fonts/, Scale=0.8]{Envy Code R}
\newfontfamily{\headingFont}{NunitoSans-Regular}[Extension = .ttf, Path=fonts/]

\newfontfamily{\awesome}{Font Awesome 5 Free-Regular-400}[Extension = .otf, Path=fonts/]
\newfontfamily{\awesomeB}{Font Awesome 5 Free-Solid-900}[Extension = .otf, Path=fonts/]
\def\faStarO{\awesome\symbol{61445}}
\def\faStar{\awesomeB\symbol{61445}}

\def\@zeroStars{\faStarO\faStarO\faStarO}
\def\@oneStar{\faStar\faStarO\faStarO}
\def\@twoStars{\faStar\faStar\faStarO}
\def\@threeStars{\faStar\faStar\faStar}

\def\level#1{\ifnum#1=0\let\@level\@zeroStars
               \else\ifnum#1=1\let\@level\@oneStar
                 \else\ifnum#1=2\let\@level\@twoStars
                   \else\ifnum#1=3\let\@level\@threeStars
                     \else\let\@level\@zeroStars\fi\fi\fi\fi}
\level{0}

\usetikzlibrary{shapes.geometric}
\AddToShipoutPictureFG{
  \begin{tikzpicture}[remember picture, overlay, transform shape]
    \node [anchor=north west, inner sep=0pt] at (current page.north west)
    { \begin{tikzpicture}[every node/.append style = {anchor=center}]
        \node[draw,fill=bannerColour,rectangle,minimum width = 21cm,minimum height = 3.6cm,anchor=north west] (banner) at (0,0) {\vphantom{1}};
        \draw[white,thick] (7.2,-0.25) -- (7.2,-3.45);
        \node[align=left, text width= 4cm, anchor=west] at (2.8,-2.7) {\color{white}\Large \@level};
        \node[align=right, text width= 12cm, anchor=east] at (20.0,-2.7) {\color{white}\Huge \headingFont\@title};
        \node[align=left, text width= 4cm, anchor=south west] at (0.6,-3.0) {\includegraphics{banner/TuringLabGuide.pdf}};
        \node[align=right, text width= 4cm, anchor=north east] at (20.8,0) {\includegraphics[scale=0.2]{banner/PCB.pdf}};
        \node[align=right, text width= 12cm, anchor=north east] at (20.7,-29.2) {\ifx\@author\@empty\else\color{bannerColour}\scriptsize\it Deze guide is mogelijk gemaakt door \@author\fi};

      \end{tikzpicture} };
  \end{tikzpicture} }
\pagestyle{empty}

\def\title#1{\gdef\@title{#1}
  \newwrite\tempfile
  \immediate\openout\tempfile=\jobname.tit
  \immediate\write\tempfile{#1}
  \immediate\closeout\tempfile }

\newlength\titleindent
\setlength\titleindent{1cm}

\titleformat{\section}
  {\headingFont\huge\color{bannerColour}}{\llap{\parbox{\titleindent}{\thesection\hfill}}}{0em}{}

\titleformat{\subsection}
  {\headingFont\Large\color{bannerColour}}{\llap{\parbox{\titleindent}{\thesubsection\hfill}}}{0em}{}

\titleformat{\paragraph}
  [{runin}]{\bf\headingFont\color{bannerColour}}{}{}{}


\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{10} % for bold
\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{10}  % for normal

% Custom colors
\usepackage{color}
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}

% Python style for highlighting
\newcommand\pythonstyle{\lstset{
  language=Python,
  basicstyle=\ttfamily,
  otherkeywords={self},
  keywordstyle=\ttfamily\color{deepblue},
  emph={MyClass,__init__, __del__},
  emphstyle=\ttfamily\color{deepred},
  stringstyle=\color{deepgreen},
  commentstyle=\color{gray},
  showstringspaces=false,
  literate={},
  firstnumber=0,
  numbers=left,
  xleftmargin=2em,
  stepnumber=1,
  numberstyle=\tiny\color{gray},
  captionpos=b,
  moredelim=[s][\color{gray}\itshape]{@}{\ } % Decorators
}}

\renewcommand{\lstlistingname}{Codevoorbeeld}

% Python environment
\lstnewenvironment{python}[1][]
{
  \pythonstyle
  \lstset{#1}
}
{}

% Python for external files
\newcommand\pythonexternal[2][]{{
  \pythonstyle
  \lstinputlisting[#1]{#2}}}

% Python for inline
\newcommand\pythoninline[1]{{\pythonstyle\lstinline!#1!}}

% Bash style
\newcommand\bashstyle{\lstset{
  language=Bash,
  basicstyle=\ttfamily,
  keywordstyle=\ttfamily\color{deepblue},
  emphstyle=\ttfamily\color{deepred},
  stringstyle=\color{deepgreen},
  commentstyle=\color{gray},
  showstringspaces=false,
  literate={},
  xleftmargin=2em,
  stepnumber=1,
  captionpos=b,
}}

% Bash environment
\lstnewenvironment{bash}[1][]
{
  \bashstyle
  \lstset{#1}
}
{}

% Bash for external files
\newcommand\bashexternal[2][]{{
  \bashstyle
  \lstinputlisting[#1]{#2}}}

% Bash for inline
\newcommand\bashinline[1]{{\bashstyle\lstinline!#1!}}
