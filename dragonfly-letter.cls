\NeedsTeXFormat{LaTeX2e}
%Implementation of the Dragonfly Data Science template
\ProvidesClass{dragonfly-letter}[2014/03/20 Class definition by Finlay Thompson]

\LoadClass[a4paper,10pt]{article}

%% named colours
\usepackage[usenames,dvipsnames,svgnames,table]{xcolor}
\definecolor{logo-blue}{RGB}{28,152,196}
\definecolor{logo-grey}{RGB}{64,64,64}
\definecolor{cream}{RGB}{229,222,204}
\definecolor{green}{RGB}{80,173,133}
\definecolor{terra-cotta}{RGB}{235,122,89}
\definecolor{charred-red}{RGB}{207,69,71}
\definecolor{plum}{RGB}{91,52,87}
\definecolor{mint}{RGB}{157,196,169}
\definecolor{grey}{RGB}{127,127,127}


% Page layout
\usepackage[
    hmargin={51mm,30mm},
    vmargin={30mm,40mm}]{geometry}
    
% Fonts and paragraphs
\usepackage{fontspec}
\setmainfont[Mapping=tex-text,
    ItalicFont     = {Palatino Linotype Italic},
    BoldFont       = {Palatino Linotype Bold},
    BoldItalicFont = {Palatino Linotype Bold Italic}]{Palatino Linotype}
\raggedright

\newfontfamily\omnes[Mapping=tex-text,
    ItalicFont     = {OmnesRegular-Italic},
    BoldFont       = {OmnesSemibold-Roman},
    BoldItalicFont = {OmnesSemibold-Italic}]{OmnesRegular-Roman}

\setlength{\parskip}{3mm}
\setlength{\parindent}{0cm}
\linespread{1.2}


% titles
\usepackage[bf,sf,pagestyles]{titlesec}

\titleformat{\section}{\Large\bf\omnes}{\thesection.}{1em}{}
\titleformat{\subsection}{\color{logo-blue}\large\bf\omnes}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\color{logo-blue}\large\bf\omnes}{\thesubsubsection}{1em}{}
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\titlespacing{\subsubsection}{0pt}{\baselineskip}{0pt}


\usepackage{amsmath}
\usepackage{appendix}
\usepackage{placeins}
\usepackage{type1cm}
\usepackage{eso-pic}
\usepackage{flafter}
\usepackage{paralist}
\usepackage{graphicx}
\usepackage{array}
\usepackage{multirow}
\usepackage{rotating}
\usepackage{engord}
\usepackage{textcomp}
\usepackage{lineno}
\usepackage[export]{adjustbox}
\usepackage{wallpaper}
\usepackage[perpage]{footmisc}

\hyphenpenalty=5000
\tolerance=1000




\usepackage{enumitem}
\setlist{noitemsep}
\setlist[1]{labelindent=\parindent,partopsep=-1em,itemsep=-1em}
\setlist[itemize]{leftmargin=*}
\setlist[itemize,1]{label=$\triangleright$}
\setlist[enumerate]{labelsep=*, leftmargin=1.5pc}
\setlist[enumerate,1]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,2]{label=\emph{\alph*}), ref=\theenumi.\emph{\alph*}}
\setlist[enumerate,3]{label=\roman*), ref=\theenumii.\roman*}
\setlist[description]{font=\sffamily\bfseries}

\usepackage{fancyhdr}
\usepackage{calc}

\fancypagestyle{toc}{
    \fancyfoot[LO,RO,LE,RE]{}
}

\fancypagestyle{main}{
    \fancyhf{}
    \fancyfoot[L]{\color{logo-blue}\small\omnes\bf\thepage}
    \fancyfoot[R]{\color{grey}\small\omnes\bf}
    \renewcommand{\headrulewidth}{0pt} 
}
\pagestyle{main}


\usepackage{tocloft}
%\usepackage[usenames, dvipsnames]{color}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{textcomp}
\usepackage{hhline}

\usepackage[labelsep=colon,singlelinecheck=false]{caption}
\usepackage[captionskip=0pt,
            nearskip=0pt,farskip=0pt,position=top,
            justification=justified,singlelinecheck=false]{subfig}
\renewcommand{\captionfont}{\small\omnes}
\renewcommand{\captionlabelfont}{\small\bf\omnes}


%\usepackage{float}
%\floatstyle{plain}
%\restylefloat{figure}
%\floatstyle{plaintop}
%\restylefloat{table}
%\captionsetup[subfloat]{singlelinecheck=off}

% Make wide tables
\newenvironment{widetable}[1][tbp]
  {\table[#1]
   \begin{adjustwidth}{-22mm}{0mm}
  }%
  {\end{adjustwidth}\endtable}

\newenvironment{widefigure}[1][tbp]
   {\begin{figure}[#1]
   \begin{adjustwidth}{-22mm}{0mm}
  }%
  {\end{adjustwidth}\end{figure}}



\newenvironment{fulltable}[1][tbp]
 {\begin{table}[#1]%
  \hspace*{-22mm}%
  \begin{minipage}{1.166\textwidth}}
 {\end{minipage}\end{table}}

\renewcommand{\topfraction}{0.9}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.8}

\newcommand{\degrees}{\ensuremath{^\circ}}
\newcommand{\minutes}{\ensuremath{^\prime}}
 
\setcounter{tocdepth}{2}

\usepackage[colorlinks,
            pdfpagemode=UseOutlines,
            bookmarksnumbered,
            linkcolor=black,
            anchorcolor=black,
            citecolor=black,
            filecolor=black,
            menucolor=black,
            urlcolor=black,
            xetex]{hyperref}
\usepackage{url}
\urlstyle{ss}

\usepackage[absolute]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\usepackage{changepage}


%% Bibliography style
\usepackage[unnumberedbib]{dragonfly}
\bibliographystyle{dragonfly}

%% Table of contents
\renewcommand{\cfttoctitlefont}{\normalfont\bfseries\sffamily}
\renewcommand{\cftsecfont}{\normalfont\bfseries\sffamily}
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\cftsubsecafterpnum}{\hspace{1cm}\mbox{}}
\tocloftpagestyle{empty}
\renewcommand{\cftdot}{}

%% Default input size for graphics ... used by Sweave
\setkeys{Gin}{width=0.6\textwidth}

\renewcommand\maketitle{
    \hypersetup{  
      pdfinfo={  
        Title={\@title},  
        Author={\@author}
      }  
    }
    \newpage
    \null
    \setlength{\unitlength}{1mm}
    \noindent
    \begin{picture}(129,33)
    \put(-16,34){
    \begin{minipage}[b]{\textwidth}{
    \fontsize{6.5pt}{6.8pt}\selectfont\omnes
    \parbox{44mm}{\noindent\rule{40mm}{0.1mm}
                  Level 5, 158 Victoria St\\
                  PO Box 27353, Wellington 6141 \\ 
                  New Zealand}\\

    \vspace{1mm}
    \hspace{15mm}
    \parbox{43mm}{+64 4 385 9285 Phone\\
                  inbox@dragonfly.co.nz
                  \rule[0.5\baselineskip]{30mm}{0.1mm}
                  {\fontsize{7.5}{8}\bf\color{logo-blue}\omnes www.dragonfly.co.nz}}
    }
    \end{minipage}
    }
    \put(-41.3,14.1){
        \includegraphics[width=43.1mm]{logo.eps}
    }
    \end{picture}
    \if\@title
    {\huge\bf\omnes \@title}
    \fi

    \if\@author
    {\color{logo-blue}\large\bf
      \begin{tabular}[t]{l}%
        \@author
      \end{tabular}\par%
    }
    \fi
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}


\endinput
