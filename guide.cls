\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guide}

\LoadClassWithOptions{article}

\RequirePackage[table]{xcolor}
\RequirePackage[dutch]{babel}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[a4paper, textwidth=6.5in, textheight=8.5in, top=5cm, marginparsep=7pt, marginparwidth=.6in]{geometry}

\definecolor{bannerColour}{rgb}{0.46,0.31,0.48}
\def\bannerColour{bannerColour}

\RequirePackage[unicode, bookmarks, colorlinks, breaklinks, urlcolor=bannerColour, pdfusetitle]{hyperref}
\RequirePackage{fontspec,xunicode,eso-pic,graphicx,caption,ifthen,titlesec,fontawesome,eurosym,listings,pstricks}

\setlength\parindent{0in}
\defaultfontfeatures{Mapping=tex-text}

\setromanfont {Avenir LT 45 Book}
\setsansfont {Avenir LT 45 Book}
\setmonofont[Scale=0.8]{Envy Code R}

\def\@zeroStars{\faStarO\faStarO\faStarO}
\def\@oneStar{\faStar\faStarO\faStarO}
\def\@twoStars{\faStar\faStar\faStarO}
\def\@threeStars{\faStar\faStar\faStar}

\def\level#1{\ifthenelse{\equal{#1}{0}}{\let\@level\@zeroStars}
              {\ifthenelse{\equal{#1}{1}}{\let\@level\@oneStar}
                {\ifthenelse{\equal{#1}{2}}{\let\@level\@twoStars}
                  {\ifthenelse{\equal{#1}{3}}{\let\@level\@threeStars}
                    {\let\@level\@zeroStars}}}}}
\level{0}

\AddToShipoutPictureFG{
\begin{pspicture}(0,-26.5)
\psframe*[fillstyle=solid,fillcolor=bannerColour,linecolor=bannerColour](-5,0)(30,3.8)
\put(0.6,0.5){\includegraphics{banner/TuringLabGuide.pdf}}
\put(17.6,1.8){\includegraphics[scale=0.2]{banner/PCB.pdf}}
\psline[linecolor=white](7.2,0.25)(7.2,3)
\put(8,0.5){\hbox to 12cm{\hfill\color{white}\Huge \fontspec{Avenir LT 65 Medium}\@title}}
\put(3.0,0.575){\color{white}\Large \@level}
\end{pspicture}
}
\pagestyle{empty}

\def\title#1{\gdef\@title{#1}
  \newwrite\tempfile
  \immediate\openout\tempfile=\jobname.tit
  \immediate\write\tempfile{#1}
  \immediate\closeout\tempfile }

\newlength\titleindent
\setlength\titleindent{1cm}

\titleformat{\section}
  {\fontspec{Avenir LT 65 Medium}\huge\color{bannerColour}}{\llap{\parbox{\titleindent}{\thesection\hfill}}}{0em}{}

\titleformat{\subsection}
  {\fontspec{Avenir LT 65 Medium}\Large\color{bannerColour}}{\llap{\parbox{\titleindent}{\thesubsection\hfill}}}{0em}{}

\titleformat{\paragraph}
  [{runin}]{\bf\fontspec{Avenir LT 65 Medium}\color{bannerColour}}{}{}{}


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
