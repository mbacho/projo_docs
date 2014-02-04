%
% ociamthesis v1.8
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%
% bsc_report.cls
% Modified by mbacho
%
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsc_report}
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{report}

%------------------packages-------------------------------
%\usepackage[dvips]{graphicx,color}
\usepackage[english]{babel}
\usepackage{graphicx}
\usepackage{fourier}
\usepackage{listings}
\usepackage[usenames,dvipsnames]{color}
\usepackage[utf8x]{inputenc}
\usepackage{soul}
\usepackage[bordercolor=white,backgroundcolor=gray!30,linecolor=black,colorinlistoftodos]{todonotes}
\usepackage{multirow}
\graphicspath{{../static/img/}}
%---------------------------------------------------------------

\newcommand{\submittedtext}{{A project report submitted in partial fulfillment of the BSc (Computer Science)}}
%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\submittext#1{\gdef\@submittext{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\university#1{\gdef\@university{#1}}
\def\school#1{\gdef\@school{#1}}
\def\regno#1{\gdef\@regno{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}


%define the page size including an offset for binding
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

\def\crest{\hbox to\textwidth{\hss $\includegraphics[height=1.5in,width=1.5in]{uonlogo.png}$\hss}}


% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}{\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}
{
	\begin{alwayssingle}
	    \renewcommand{\footnotesize}{\small}
	    \renewcommand{\footnoterule}{\relax}
	    \thispagestyle{empty}
	  \null\vfill
	  \begin{center}
	    {  
	     \Huge 
	      {\bfseries {\@title}} \par
	    }
	    \vspace*{40mm} 
	    {\crest \par} 
	    \vspace*{25mm}
	    {{\Large \@author} \par}
	    {{\Large \@regno} \par}
	    {\large \vspace*{1ex}
	     {\@school} \par
	     \vspace*{1ex}
	     {\@university} \par
	     \vspace*{25mm}
	     {{\@submitdate} \par}
	     \vspace*{1ex}
	     {\it {\@degree} \par}
	     \vspace*{2ex}
	     {\@submittext}
	    }
	  \end{center}
	  \null\vfill
	\end{alwayssingle}
}

% DECLARATION
%
\newenvironment{declaration}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \vspace*{1.5cm}
  {\LARGE \bfseries Declaration}
  \vspace{0.5cm}
  \begin{quote}}
{\end{quote}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
\newenvironment{acknowledgement}
{
    \begin{alwayssingle}\thispagestyle{empty}
    \vspace*{1.5cm}
    {\Large \bfseries Acknowledgement}
    \vspace{0.5cm}
    \begin{quote}
}
{\end{quote}\end{alwayssingle}}

%ABBREVIATIONS
%
\newenvironment{abbreviations}
{
    \begin{alwayssingle}\thispagestyle{empty}
    \vspace*{1.5cm}
    {\Large \bfseries List of Abbreviations}
    \vspace{0.5cm}
    \begin{quote}
}
{\end{quote}\end{alwayssingle}}

%ABSTRACT
%
\renewenvironment{abstract} 
{
    \begin{alwayssingle} \thispagestyle{empty}
    \vspace*{1.5cm}
    {\Large \bfseries  Abstract}
    \vspace{0.5cm}
    \begin{quote}
}
{\end{quote}\end{alwayssingle}}

%CODE SNIPPETS
% #1 filename of code
% #2 caption of code
% #3 style of code [py_style, ]
\newenvironment{codesnippet}[3]
{
	\definecolor{comment}{RGB}{0.0,0.4,0.0} % Comment color
	\definecolor{highlight}{RGB}{255,251,204} % Code highlight color
	\lstdefinestyle{py_style} {
		language=Python, 
		backgroundcolor=\color{highlight},
		basicstyle=\footnotesize\ttfamily,
		breakatwhitespace=false,
		breaklines=true, 
		captionpos=b, 
		commentstyle=\usefont{T1}{pcr}{m}{sl}\color{comment},
		frame=single, 
		frameround=tttt,
		keywordstyle=\color{Blue}\bf,
		numbers=none,
		rulecolor=\color{black},
		showstringspaces=false,
		showtabs=false,
		stringstyle=\color{Green},
		tabsize=4,
	}
	\begin{itemize}\item[]\lstinputlisting[caption=#2,label=#1,style=#3]{#1}
}
{ \end{itemize} }

%REFERENCES
\newenvironment{references}{
    \chapter{References}
}{\newpage}

%Review comment markers
% #1 comment heading
% #2 comment type [green, orange, red]
\newenvironment{review_comment}[3]
{
    \todo[color=#2,inline]{#1}
    \hl {#3}
}
{  }


\newcommand{\thead}[1]
{
    \textbf{#1}
}

