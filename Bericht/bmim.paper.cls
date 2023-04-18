% -------------------------------------------------------
% ------- BMIM style template----------------------------
% -------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{bmim.paper}[2012/10/01 paper class for bmim]
%----------------------------------------------------------------------------------------
%%% DECLARE LOGO OPTIONS %%%
%----------------------------------------------------------------------------------------
\newcount\cntInstitute
\DeclareOption{iace}{\cntInstitute=1}
\DeclareOption{ims}{\cntInstitute=2}
\DeclareOption{iebe}{\cntInstitute=3}
%----------------------------------------------------------------------------------------
%%% DECLARE LANGUAGE OPTIONS %%%
%----------------------------------------------------------------------------------------
\newcount\cntLanguage			% Set counter to change language
\DeclareOption{german}{\cntLanguage=1}
\DeclareOption{english}{\cntLanguage=2}
%----------------------------------------------------------------------------------------
%%% DECLARE CLASS OPTIONS %%%
%----------------------------------------------------------------------------------------
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{11pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ExecuteOptions{11pt}       % Execute default options

\ProcessOptions \relax

% create counter for solution option
\newcount \LoesNum
\DeclareOption{mitLoesung}{\LoesNum = 1}
\DeclareOption{ohneLoesung}{\LoesNum = 2}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\PassOptionsToClass{twoside, twocolumn}{article}
\ProcessOptions\relax

\LoadClass[twoside,twocolumn]{article}
%----------------------------------------------------------------------------------------

% Set language %
\ifodd\cntLanguage
\RequirePackage[ngerman]{babel}		% German
\else
\RequirePackage[english]{babel}		% English
\fi

% Set coding %
\RequirePackage[utf8]{inputenc}		% unicode support
\RequirePackage{lmodern}			% Changes font to 'Latin Modern'
\RequirePackage[T1]{fontenc}		% For westeuropean coding (most signs are included)
\RequirePackage{color} 				% For colors
\RequirePackage{microtype}	% Improves general appearance of the text
\RequirePackage{titlesec}	% New features for titles, headers and contents

% Graphics %
\RequirePackage{tikz}		% Package for creating graphics
\RequirePackage{graphicx}	% To import external graphics
\RequirePackage[papersize={21cm,29.7cm},top={2.9cm},bottom={2.5cm},left={2cm},right={2cm},headsep={1.5cm},dvips,pdftex]{geometry}

% Header and footer %
\RequirePackage{fancyhdr}	% pro­vides ex­ten­sive fa­cil­i­ties, both for con­struct­ing head­ers and foot­ers
\pagestyle{fancy}
\RequirePackage{ifthen}

% Packages for caption
\RequirePackage[singlelinecheck=false,labelsep=period,skip=9pt,justification=justified,font={small},labelfont={bf}]{caption}	% Set chaption layout
\ifodd\cntLanguage
\captionsetup[figure]{name=Abbildung}
\else
\captionsetup[figure]{name=Figure}
\fi

\RequirePackage{amsfonts,amstext,amssymb,amsthm,amscd,bm,paralist}
\RequirePackage{tikz}		% Package for creating graphics
\RequirePackage{array}
\RequirePackage{epstopdf}
\RequirePackage{mathpazo}
\RequirePackage{courier}
\RequirePackage{textcomp}
\RequirePackage[sort&compress]{natbib}
\RequirePackage[bottom]{footmisc}
\RequirePackage{float,verbatim}
\RequirePackage{dblfloatfix}
\RequirePackage{calc}
\RequirePackage[none]{hyphenat}
\RequirePackage{setspace}
\RequirePackage[breaklinks,hyperfootnotes=false,colorlinks=true,linkcolor=black,urlcolor=black,citecolor=black,filecolor=black]{hyperref}
\urlstyle{same}
\RequirePackage[noblocks]{authblk}
\RequirePackage{lastpage}
\RequirePackage[runin]{abstract}

% For the box
\RequirePackage[
centertags, % (default) center tags vertically
%tbtags,    % 'Top-or-bottom tags': For a split equation, place equation numbers level
% with the last (resp. first) line, if numbers are on the right (resp. left).
sumlimits,  %(default) Place the subscripts and superscripts of summation
% symbols above and below
%nosumlimits, % Always place the subscripts and superscripts of summation-type
% symbols to the side, even in displayed equations.
intlimits,  % Like sumlimits, but for integral symbols.
%nointlimits, % (default) Opposite of intlimits.
namelimits, % (default) Like sumlimits, but for certain 'operator names' such as
% det, inf, lim, max, min, that traditionally have subscripts placed underneath
% when they occur in a displayed equation.
%nonamelimits, % Opposite of namelimits.
%leqno,     % Place equation numbers on the left.
%reqno,     % Place equation numbers on the right.
fleqn,     % Position equations at a fixed indent from the left margin
% rather than centered in the text column.
]{amsmath} % To use mathematical formulas
\RequirePackage[most, many]{tcolorbox} % provides an environment for colored and framed text boxes with a heading line

% ------------------------------------------------
% ----------- DEFINE COLOURS --------------
% ------------------------------------------------
\definecolor{umitblau}{RGB}{0, 53, 103}
\definecolor{grey_line}{cmyk}{0.03,0,0.01,0.56}  % titlepage lines

% ------------------------------------------------
% --------- CUSTOM COMMANDS ------------
% ------------------------------------------------
\newcommand*{\shifttext}[2]{%
	\settowidth{\@tempdima}{#2}%
	\makebox[\@tempdima]{\hspace*{#1}#2}%
}

\newcommand{\headerbox}[1]{\setlength{\unitlength}{1cm}\colorbox{umitblau!80}{\makebox(#1){}}}

\newcommand\varRa{0.4}
\newcommand\varA{0.4}
\newcommand\varH{0.5}
\newcommand\varOff{0.1}

\newcommand{\leftbox}{
	\begin{tikzpicture}
	\ifnum\cntInstitute>0

        % iace logo
        \ifnum\cntInstitute=1
        %First value-\varOff = left bottom corner, after: anticlockwise
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (1, \varH-\varOff);
        \fi

        % ims logo
        \ifnum\cntInstitute=2
        %First value-\varOff = left bottom corner, after: anticlockwise
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (1, \varH-\varOff);
        \fi

        % iebe logo
        \ifnum\cntInstitute=3
        %First value-\varOff = left bottom corner, after: anticlockwise
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (1, \varH-\varOff);
        \fi

	% department style
	\else
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (1, \varH-\varOff);
	\fi
	\end{tikzpicture}
}

\newcommand{\midbox}{
	\begin{tikzpicture}
	\ifnum\cntInstitute>0

        % iace logo
        \ifnum\cntInstitute=1
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (11.78, \varH-\varOff);
        \fi

        % ims logo
        \ifnum\cntInstitute=2
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (12.31, \varH-\varOff);
        \fi

        % iebe logo
        \ifnum\cntInstitute=3
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (11.65, \varH-\varOff);
        \fi

	% department style
	\else
        \draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (14.24, \varH-\varOff);
	\fi
	\end{tikzpicture}
}

\newcommand{\rightbox}{
	\begin{tikzpicture}
	\draw[fill=umitblau!80, color=umitblau!80] (0, -\varOff) rectangle (1, \varH-\varOff);
	\end{tikzpicture}
}

\newtcolorbox{tcbdoublebox}[1][]{%
	enhanced jigsaw,
	sharp corners,
	colback=white,
	borderline={1pt}{-2pt}{black},
	fontupper={\setlength{\parindent}{20pt}},
	#1
}
\newtcolorbox{solution}[1][Lösung:]{
	breakable,
	colback=white,
	colbacktitle=white,
	coltitle=gray,
	colframe=gray,
	boxrule=4pt,
	sharp corners,
	detach title,
	before upper={
		\ifodd\cntLanguage
		\textbf{Lösung:}
		\else
		\textbf{Solution:}
		\fi
	}
}

\raggedbottom
\addtolength{\topskip}{0pt plus 12pt}
\setlength{\parindent}{0pt}
\setlength{\parskip}{2pt plus 0.5ex minus 0.2ex}
\renewcommand\Authfont{\Large\fontfamily{fvs}\selectfont}
\renewcommand\Affilfont{\small\fontfamily{fvs}\selectfont\color{grey_line}}
\renewcommand\Authands{ and }
\setlength{\affilsep}{9pt}
\setlength{\abstitleskip}{-\parindent}
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}
\renewcommand{\abstractnamefont}{\normalsize\textcolor{umitblau!75}}
\renewcommand{\abstracttextfont}{\normalsize}
\newcommand{\keywords}[1]{\par\noindent{\normalsize{\normalsize\textcolor{umitblau!75}{Keywords\/}} #1}} % if there is a dot at the end (., ! or ?) do nothing, otherwise add . -> \ifnum\the\spacefactor>3000. \fi
\newcommand{\articleabstract}[1]{\begin{abstract}\label{abstract} #1\end{abstract}}
\renewcommand{\captionfont}{\footnotesize\fontfamily{fvs}\selectfont}
\renewcommand{\captionlabelfont}{\bfseries\footnotesize\fontfamily{fvs}\selectfont}
\captionsetup[table]{justification=raggedright,position=bottom}

\setlength{\columnsep}{0.75cm}
\setlength{\unitlength}{1mm}

\widowpenalty=9999
\clubpenalty=9999

\newlength{\myFootnoteWidth}
\newlength{\myFootnoteLabel}
\setlength{\myFootnoteLabel}{0.8em}
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}%
}

%
% multicol option, obsolete
%
%\def\closeopenmulticols{
%   \def\@tempa{multicols}
%   \ifx\@tempa\@currenvir
%      \end{multicols}
%  \fi
%}
%
%\AtEndDocument{\closeopenmulticols}
%
%\newcommand{\wide}[1]{\closeopenmulticols#1\begin{multicols}{2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		Title page
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\subarticletitle}[1]{\gdef\@subarticletitle{#1}}
\newcommand{\@subarticletitle}{\@latex@error{No \noexpand\subarticletitle given}\@ehc}

\newcommand{\articletitle}[1]{\gdef\@articletitle{#1}}
\newcommand{\@articletitle}{\@latex@error{No \noexpand\articletitle given}\@ehc}

\newcommand{\runningtitle}{\let\\=\relax\@articletitle}

\newcommand{\correspemail}[1]{\gdef\@correspemail{#1}}
\newcommand{\@correspemail}{\@latex@error{No \noexpand\correspemail given}\@ehc}

\newcommand{\journaltitle}[1]{\gdef\@journaltitle{#1}}


\newcommand{\volume}[1]{\gdef\@volume{#1}}
\newcommand{\@volume}{\@latex@error{No \noexpand\volume given}\@ehc}

\newcommand{\pubyear}[1]{\gdef\@pubyear{#1}}
\newcommand{\@pubyear}{\@latex@error{No \noexpand\pubyear given}\@ehc}

\newcommand{\licensee}[1]{\gdef\@licensee{#1}}
\newcommand{\@licensee}{\@latex@error{No \noexpand\licensee given}\@ehc}

\newcommand{\authorlist}[1]{\gdef\@authorlist{#1}}
\newcommand{\@authorlist}{\@latex@error{No \noexpand\authorlist given}\@ehc}

\newcommand{\dates}[2][]{\gdef\@dates{\ifthenelse{\equal{#1}{}}{Accepted #2 \@pubyear}{Received #1 \@pubyear; Accepted #2 \@pubyear}}}

\newcommand{\doi}[1]{\gdef\@doi{DOI: 10.5772/#1}}
\newcommand{\@doi}{\@latex@error{No \noexpand\doi given}\@ehc}

\newcommand{\articlenumber}[1]{\gdef\@articlenumber{#1}}
\newcommand{\@articlenumber}{\@latex@error{No \noexpand\articlenumber given}\@ehc}

\newcommand{\articletype}[1]{\ifthenelse{\equal{#1}{inv}}{\gdef\@articletype{Invited
Paper}}{\gdef\@articletype{\LARGE{\@subarticletitle}}
}}
\newcommand{\@articletype}{}

\newcommand{\corresp}{$^\star$}

% defaults
\licensee{\phantom{FIRST AUTHOR}}
\correspemail{\phantom{EMAIL}}
\journaltitle{~}
\volume{~}
\pubyear{2014}
\authorlist{\phantom{AUTHOR LIST}}
\doi{~}
\articlenumber{No}
\articletype{}
\dates[D M]{D M}

% ------------------------------------------------
% ------------- HEADER FOOTER ------------
% ------------------------------------------------
\fancyhead{}

\fancyhead[L]{
	\fontsize{12}{12}\selectfont
	\ifnum\cntInstitute>0
	% iace logo
	\ifnum\cntInstitute=1
	\vspace{0.05cm}
	\setlength{\unitlength}{1cm}
	\shifttext{-2.4cm}{\leftbox}
	\shifttext{-3.25cm}{\raisebox{-0.65mm}{\includegraphics[width=2.30cm]{images/iace.pdf}}}
	\shifttext{-3.85cm}{\midbox}
	\fi
	% ims logo
	\ifnum\cntInstitute=2
	\vspace{0.24cm}
	\setlength{\unitlength}{1cm}
	\shifttext{-2.4cm}{\leftbox}
	\shifttext{-2.7cm}{\raisebox{-1.5mm}{\includegraphics[width=1.35cm]{images/ims.pdf}}}
	\shifttext{-3.0cm}{\midbox}
	\fi
	% iebe logo
	\ifnum\cntInstitute=3
	\setlength{\unitlength}{1cm}
	\shifttext{-2.4cm}{\leftbox}
	\shifttext{-2.7cm}{\raisebox{-0.1mm}{\includegraphics[width=2.01cm]{images/iebe.pdf}}}
	\shifttext{-3.0cm}{\midbox}
	\fi
	% department style
	\else
	\vspace{0.24cm}
	\setlength{\unitlength}{1cm}
	\shifttext{-2.4cm}{\leftbox}
	\shifttext{-3.95cm}{\midbox}
	\fi
}

\fancyhead[R]{
	\fontsize{12}{12}\selectfont
	\setlength{\unitlength}{1cm}
    \ifodd\cntLanguage
	    \shifttext{3.05cm}{\raisebox{-2.85mm}{\includegraphics[height=8mm]{images/logo_umit_de.pdf}}}
    \else
	    \shifttext{3.05cm}{\raisebox{-2.85mm}{\includegraphics[height=8mm]{images/logo_umit_eng.pdf}}}
    \fi
    \shifttext{2.75cm}{\rightbox}
}

\fancyfoot[RO]{
    \begin{picture}(0,0)
        \put(4.7,0) {\footnotesize\fontfamily{fvs}\selectfont\textcolor{grey_line}{\thepage}}
    \end{picture}
}

\fancyfoot[LE]{
    \begin{picture}(0,0)
        \put(-4.7,0) {\footnotesize\fontfamily{fvs}\selectfont\textcolor{grey_line}{\thepage}}
    \end{picture}
}

\fancyfoot[LO]{{\footnotesize\fontfamily{fvs}\selectfont\textcolor{umitblau}{\@subarticletitle}}\hfill{}}
\fancyfoot[RE]{\hfill{}{\footnotesize\fontfamily{fvs}\selectfont\textcolor{umitblau}{\@subarticletitle}}}

\cfoot{}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Set titlepage:
\setlength{\unitlength}{1mm}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[L]{
  	\fontsize{12}{12}\selectfont
  	\ifnum\cntInstitute>0
  	% iace logo
  	\ifnum\cntInstitute=1
	  	\vspace{0.05cm}
	  	\setlength{\unitlength}{1cm}
	  	\shifttext{-2.4cm}{\leftbox}
	  	\shifttext{-3.25cm}{\raisebox{-0.65mm}{\includegraphics[width=2.30cm]{images/iace.pdf}}}
	  	\shifttext{-3.85cm}{\midbox}
  	\fi
  	% ims logo
  	\ifnum\cntInstitute=2
	  	\vspace{0.24cm}
	  	\setlength{\unitlength}{1cm}
	  	\shifttext{-2.4cm}{\leftbox}
	  	\shifttext{-2.7cm}{\raisebox{-1.5mm}{\includegraphics[width=1.35cm]{images/ims.pdf}}}
	  	\shifttext{-3.0cm}{\midbox}
  	\fi
  	% iebe logo
  	\ifnum\cntInstitute=3
	  	\setlength{\unitlength}{1cm}
	  	\shifttext{-2.4cm}{\leftbox}
	  	\shifttext{-2.7cm}{\raisebox{-0.1mm}{\includegraphics[width=2.01cm]{images/iebe.pdf}}}
	  	\shifttext{-3.0cm}{\midbox}
  	\fi
  	% department style
  	\else
	  	\vspace{0.24cm}
	  	\setlength{\unitlength}{1cm}
	  	\shifttext{-2.4cm}{\leftbox}
	  	\shifttext{-3.95cm}{\midbox}
  	\fi
  }

  \fancyhead[R]{
    \fontsize{12}{12}\selectfont
	\setlength{\unitlength}{1cm}
    \ifodd\cntLanguage
	    \shifttext{3.05cm}{\raisebox{-2.85mm}{\includegraphics[height=8mm]{images/logo_umit_de.pdf}}}
    \else
	    \shifttext{3.05cm}{\raisebox{-2.85mm}{\includegraphics[height=8mm]{images/logo_umit_eng.pdf}}}
    \fi
    \shifttext{2.75cm}{\rightbox}
  }

  \fancyfoot[R]{
      \begin{picture}(0,0)
          \put(4.7,0) {\footnotesize\fontfamily{fvs}\selectfont\textcolor{grey_line}{\thepage}}
      \end{picture}
  }

  \fancyfoot[L]{{\footnotesize\fontfamily{fvs}\selectfont\textcolor{umitblau}{\@subarticletitle}}\hfill{}}

  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\def\@maketitle{
    \newpage
    \setlength{\parsep}{0pt plus 0.5ex minus 0.2ex}
    \begin{flushleft}
        {\Large\fontfamily{fvs}\selectfont\@journaltitle}\\
        \begin{spacing}{0.6}{\Huge\fontfamily{fvs}\selectfont\textcolor{umitblau!75}{\@articletitle}}\vspace{12pt}\end{spacing}
        {\Large\fontfamily{fvs}\selectfont{\@articletype}}\\
        \rule{22mm}{.5pt}\\[12pt]
        \begin{spacing}{0.8}{\small\fontfamily{fvs}\selectfont{\@authorlist}}\vspace{5pt}\end{spacing}
        Datum: \@date\vspace{5pt}\\
        \rule{22mm}{2pt}\\[10pt]
    \end{flushleft}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		Journal structure and fonts
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\csname the#1\endcsname
\ifnum #2<1.\fi}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec\hspace{1ex}}%
          \interlinepenalty \@M #8 \@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand \small{%
   \@setfontsize \small\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}

\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt\@ixpt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large\@xpt\@xiipt}
\renewcommand\Large{\@setfontsize\Large\@xiipt{13.6}}
\renewcommand\LARGE{\@setfontsize\LARGE{15.3}{20.6}}
\renewcommand\huge{\@setfontsize\huge{18}{23}}
\renewcommand\Huge{\@setfontsize\Huge{27}{30}}
\renewcommand\small{\@setfontsize\small{8}{9.5}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{7}{8.5}}

\setcounter{secnumdepth}{5}%
\setcounter{tocdepth}{5}%

\titleformat{\subsection}[block]{\itshape\normalsize\raggedright}{\thesubsection.}{.0em}{\itshape\normalsize}[\rm]
\titleformat{\subsubsection}[block]{\itshape\normalsize\raggedright}{\thesubsubsection.}{.2em}{\itshape\normalsize}[\rm]
\titleformat{\paragraph}[block]{\itshape\normalsize\raggedright}{\theparagraph}{.2em}{\itshape\normalsize}[\rm]
\titleformat{\subparagraph}[block]{\itshape\normalsize\raggedright}{\thesubparagraph}{.2em}{\itshape\normalsize}[\rm]

\titlespacing{\section}{0pt}{8pt}{0pt}
\titlespacing{\subsection}{0pt}{8pt}{0pt}
\titlespacing{\subsubsection}{0pt}{8pt}{0pt}
\titlespacing{\paragraph}{0pt}{0pt}{0pt}
\titlespacing{\subparagraph}{0pt}{0pt}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		Floats
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength\parindent{15em}
\setcounter{topnumber}{8}
\renewcommand\topfraction{1}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.99}
\setcounter{totalnumber}{8}
\renewcommand\textfraction{0.01}
\renewcommand\floatpagefraction{.8}
\setcounter{dbltopnumber}{6}
\renewcommand\dbltopfraction{1}
\renewcommand\dblfloatpagefraction{.8}

\setlength\floatsep        {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep   {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\intextsep      {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{6\p@ \@plus 2\p@ \@minus 2\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		Lists
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parindent}{13pt}
\newdimen\svitemindent \setlength{\svitemindent}{\parindent}

\def\setitemindent#1{\settowidth{\labelwidth}{#1}%
        \let\setit@m=Y%
        \leftmargini\labelwidth
        \advance\leftmargini\labelsep
   \def\@listi{\leftmargin\leftmargini
        \labelwidth\leftmargini\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\medskipamount
        \itemsep=\parskip \advance\itemsep by -\parsep}}
\def\setitemitemindent#1{\settowidth{\labelwidth}{#1}%
        \let\setit@m=Y%
        \leftmarginii\labelwidth
        \advance\leftmarginii\labelsep
\def\@listii{\leftmargin\leftmarginii
        \labelwidth\leftmarginii\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip \advance\itemsep by -\parsep}}

\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \ifx\setit@m\undefined
       \ifnum \@itemdepth=1 \leftmargini=\svitemindent
          \labelwidth\leftmargini\advance\labelwidth-\labelsep
          \leftmarginii=\leftmargini \leftmarginiii=\leftmargini
       \fi
    \fi
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter\list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\rlap{##1}\hss}}%
  \fi}

\let\ts\,

\setlength \labelsep     {5\p@}
\setlength\leftmargini   {13\p@}
\setlength\leftmargin    {\leftmargini}
\setlength\leftmarginii  {\leftmargini}
\setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini}
\setlength\labelwidth    {\leftmargini}
\addtolength\labelwidth{-\labelsep}

\def\@listI{\leftmargin\leftmargini
        \parsep=\parskip
        \topsep=\medskipamount
        \itemsep=\parskip \advance\itemsep by -\parsep}
\let\@listi\@listI
\@listi

\def\@listii{\leftmargin\leftmarginii
        \labelwidth\leftmarginii
        \advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip
        \advance\itemsep by -\parsep}

\def\@listiii{\leftmargin\leftmarginiii
        \labelwidth\leftmarginiii\advance\labelwidth by -\labelsep
        \parsep=\parskip
        \topsep=\z@
        \itemsep=\parskip
        \advance\itemsep by -\parsep
        \partopsep=\topsep}

\setlength\arraycolsep{1.5\p@}
\setlength\tabcolsep{1.5\p@}

\renewcommand{\labelitemii}{\textbullet}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		Resetup and misc.
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width 50\p@
  \kern2.6\p@}

\newdimen\foot@parindent
\foot@parindent 10.83\p@

\renewcommand{\bibsection}{\section{References}}
\setlength{\bibhang}{1.24cm}
\setlength{\parindent}{3cm}
\setlength{\bibsep}{0cm}
\bibliographystyle{unsrt}
\gdef\harvardand{\&}
\renewcommand\harvardurl[1]{\textnormal{URL:} \textit{#1}}

\usepackage{soul}% razmak izmedju slova
\sodef\rzs{\normalfont}{-.03em}{.1em }{3.1em}

\setlength{\parindent}{0pt}
\sloppypar

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		Solution Option
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Loesung}[1]{
	\ifodd\LoesNum
	\begin{solution}
		\itshape\input{#1}
	\end{solution}
	\fi
}

\newcounter{PktTeil}
\newcounter{PktAuf}
\newcommand{\Pkte}[1]{\fbox{\textbf{#1\,P.}}\addtocounter{PktTeil}{#1}\addtocounter{PktAuf}{#1}}
\newcommand{\Pkteb}[1]{\fbox{\textbf{#1\,P.}}}
\newcommand{\PkteTeil}{\color{green}\dotfill $\mathbf{\Sigma}$ \textbf{Teilaufgabe: \arabic{PktTeil}\,P.}\setcounter{PktTeil}{0}\color{black}}
\newcommand{\PkteAufg}{\color{red}\dotfill $\mathbf{\Sigma}$ \textbf{Aufgabe: \arabic{PktAuf}\,P.}\setcounter{PktAuf}{0}\color{black}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%		EOF
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
