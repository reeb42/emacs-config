%%
%% @FILE-NAME@
%%
%% Made by (@USER-NAME@)
%% Mail    <vincent.cuissard@gmail.com>
%%
%% En-t�te LaTeX remasteris�e
%%

% ------------------------------------------------------
%                   Package a loader
% ------------------------------------------------------
\documentclass[a4paper]{report}
\usepackage[french]{babel}
\usepackage[dvips,final]{graphics}
\usepackage[latin1]{inputenc}
% ------------------------------------------------------ 


% ------------------------------------------------------
%                  Marges
% ------------------------------------------------------
\textheight=23.2 true cm%
\voffset=-1.5 true cm%
\textwidth=15.5 true cm%
\hoffset=-1.5 true cm
% ------------------------------------------------------



% ------------------------------------------------------
%                     MACROS
% ------------------------------------------------------
\newcommand{\chapter}[1]{\chapter{\LARGE{\bf #1}}}
\newcommand{\section}[1]{\section{\Large{\bf\sc #1}}}
\newcommand{\subsection}[1]{\subsection{\large#1}}
\newcommand{\subsubsection}[1]{\subsubsection{\large#1}}
\newcommand{\paragraph}[1]{\paragraph{\small{\sl \bf #1}}}
\newcommand{\subparagraph}[1]{\subparagraph{\small#1}}
% ------------------------------------------------------

\begin{document}

% ------------------------------------------------------
%            Page de Garde - Table des mati�res
% ------------------------------------------------------
\frenchspacing
\title{\textbf{#TITRE#}}
\author{\textbf{CUISSARD Vincent}}
\pagestyle{headings}
\setcounter{page}{1}
\tableofcontents
\clearpage
% ------------------------------------------------------



% ------------------------------------------------------
%             Inclusion des fichiers
% ------------------------------------------------------
\begin{small}
\input{#CHAP 1.tex}
\input{#CHAP 2.tex}
\end{small}
% ------------------------------------------------------

\listoffigures
%\bibliography{#NAME}

\end{document}
