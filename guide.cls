\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guide}

\LoadClassWithOptions{article}

\RequirePackage[table]{xcolor}
\RequirePackage{pstricks}
\RequirePackage[dutch]{babel}
\RequirePackage[autostyle]{csquotes}
\RequirePackage[a4paper, textwidth=6.5in, textheight=8.5in, top=5cm, marginparsep=7pt, marginparwidth=.6in]{geometry}

\definecolor{bannerColour}{rgb}{0.46,0.31,0.48}
\def\bannerColour{bannerColour}

\RequirePackage[unicode, bookmarks, colorlinks, breaklinks, urlcolor=bannerColour]{hyperref}
\RequirePackage{fontspec,xunicode,eso-pic,graphicx,ifthen,titlesec,fontawesome,eurosym}

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
\rput[rb](20,0.5){\color{white}\Huge \fontspec{Avenir LT 65 Medium}\@title}
\rput[rb](4.5,0.575){\color{white}\Large \@level}
\end{pspicture}
}
\pagestyle{empty}

\newlength\titleindent
\setlength\titleindent{1cm}

\titleformat{\section}
  {\fontspec{Avenir LT 65 Medium}\huge\color{bannerColour}}{\llap{\parbox{\titleindent}{\thesection\hfill}}}{0em}{}
