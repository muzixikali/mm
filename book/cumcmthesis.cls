\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cumcmthesis}[2017/09/16 v2.6 Standard LaTeX Template for CUMCM]

%% 初始化
\newif\if@mcm@bwprint\@mcm@bwprintfalse
\newif\if@mcm@preface\@mcm@prefacetrue

%%%% 承诺书
\newcommand\mcm@tokens@keywords{}
\newcommand*\mcm@tokens@tihao{}
\newcommand*\mcm@tokens@baominghao{}
\newcommand*\mcm@tokens@schoolname{}
\newcommand*\mcm@tokens@membera{}
\newcommand*\mcm@tokens@memberb{}
\newcommand*\mcm@tokens@memberc{}
\newcommand*\mcm@tokens@supervisor{}
\newcommand*\mcm@tokens@yearinput{}
\newcommand*\mcm@tokens@monthinput{}
\newcommand*\mcm@tokens@dayinput{}

%%%% 编号专用页
%% 选项定义
\DeclareOption{colorprint}{\@mcm@bwprintfalse}
\DeclareOption{bwprint}{\@mcm@bwprinttrue}
\DeclareOption{withoutpreface}{\@mcm@prefacefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% 选项执行
\ExecuteOptions{colorprint}
\ProcessOptions\relax

%% 载入基类
\LoadClass[a4paper,12pt]{article}

%% 载入宏包
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% 支持中文
\RequirePackage{ctex}

%% 页面布局
\RequirePackage{geometry}

%% 数学相关
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{titletoc}

%% 颜色相关
\RequirePackage{xcolor}
% 颜色方案
\definecolor{color1}{HTML}{FAFAF8}
\definecolor{color2}{HTML}{636d83}
\definecolor{color3}{HTML}{10b1fe}
\definecolor{color4}{HTML}{3fc56b}
\definecolor{color5}{HTML}{ce9887}
\definecolor{color6}{HTML}{f9c859}
\definecolor{color7}{HTML}{ff78f8}
\definecolor{color8}{HTML}{9f7efe}
\definecolor{color9}{HTML}{3691ff}
\definecolor{color10}{HTML}{ff936a}
\definecolor{color11}{HTML}{ff6480}
\definecolor{color12}{HTML}{7a82da}

%% 图片相关
\RequirePackage{graphicx}

%% 表格相关
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}   % 三线表相关
\RequirePackage{multirow}   % 纵向合并
\RequirePackage{bigstrut}   % 调整间隔
\RequirePackage{bigdelim}   % 定界符
\RequirePackage{cprotect}

%% 代码相关
\RequirePackage{listings}
\renewcommand{\lstlistingname}{代码}
\lstset{
    frame=tb,
    aboveskip=2mm,
    belowskip=2mm,
    showstringspaces=false,
    columns=flexible,
    framerule=1pt,
    rulecolor=\color{color12},
    backgroundcolor=\color{color1},
    basicstyle={\small \ttfamily},
    keywordstyle=\color{color3},
    commentstyle=\color{color2},
    stringstyle=\color{color6},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=4,
    numbers=left,
    numberstyle={\tiny \color{color2}},
    stepnumber=5,
    numbersep=5pt
}

\RequirePackage{indentfirst} % 首行缩进
\RequirePackage{caption} % 设置浮动体的标题
\RequirePackage{enumitem}   % 定制列表环境
\RequirePackage{ulem}   % 下划线
\RequirePackage{calc}   % 尺寸计算


%% 超链接相关
\RequirePackage{hyperref}
\hypersetup{
  hidelinks,
	colorlinks=true,
	allcolors=color2,
	pdfstartview=FitH,
	breaklinks=true,
  linktocpage,
  linktoc=all}

%% 页面布局
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}
\renewcommand*{\baselinestretch}{1.38}

%% 设置表格中的行间距
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}
	{\bgroup
	\renewcommand{\arraystretch}{1.1}
	\mcm@oldtabular}
	{\mcm@endoldtabular\egroup}

%% 每行缩进两个汉字
\setlength\parindent{2em}

%% 字体
\setmainfont{Times New Roman}
\setmonofont{Courier New}
\setsansfont{Arial}
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}

%% 字号
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}

%% 数学环境, 定理等设置
\newtheorem{definition}{\mcm@cap@definition}
\newtheorem{theorem}{\mcm@cap@theorem}
\newtheorem{lemma}{\mcm@cap@lemma}
\newtheorem{corollary}{\mcm@cap@corollary}
\newtheorem{assumption}{\mcm@cap@assumption}
\newtheorem{conjecture}{\mcm@cap@conjecture}
\newtheorem{axiom}{\mcm@cap@axiom}
\newtheorem{principle}{\mcm@cap@principle}
\newtheorem{problem}{\mcm@cap@problem}
\newtheorem{example}{\mcm@cap@example}
\newtheorem{proof}{\mcm@cap@proof}
\newtheorem{solution}{\mcm@cap@solution}

%% 浮动相关
\RequirePackage{float}

%% 图片相关
% 图片扩展名
\DeclareGraphicsExtensions{.pdf,.jpg,.png}
% 图片路径
\graphicspath{{../image/}{../images/}{../figures/}{image/}{images/}{figure/}}

%% 图标标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\DeclareCaptionFont{hei}{\bf}
% 图片标题
\captionsetup[figure]{
	format=hang,
	labelsep=quad,
	font={song,minusfour,hei}, 
	position=bottom
}
% 表格标题
\captionsetup[table]{
	format=hang,
	labelsep=quad,
	font={song,minusfour,hei},
	position=top
}

%% 列表相关
\setlist{
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}


%% 封面相关
\renewcommand{\maketitle}{\par
	\begingroup
      \newpage
      \global\@topnum\z@
      \@maketitle
    \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\def\@maketitle{%
  \newpage
  \if@mcm@preface
  \null
  \vskip2ex
  \thispagestyle{empty}
  {\zihao{4}\mcm@commit@string@headname\\[-3pt]
  \noindent\rule{\textwidth-1.34em}{1pt}\par}
  \begin{center}%
    {\zihao{-3}\bfseries\heiti \mcm@commit@string@titlea \par}%
    {\vskip1ex\zihao{3}\bfseries\songti \mcm@commit@string@titleb \par}
  \end{center}
    {\zihao{-4} \mcm@commit@string@contents \par}
    {\vskip1ex\zihao{-4}
    \renewcommand{\ULthickness}{0.4pt}\setlength{\ULdepth}{2pt}
    \hspace*{2em}\mcm@commit@string@problemnum\uline{\hspace{1em}\mcm@tokens@tihao\hfill}\makebox[0.66em]{}\par
    \mcm@commit@string@signupnum\uline{\hspace{1em}\mcm@tokens@baominghao\hfill}\makebox[0.66em]{}\par
    \mcm@commit@string@schoolname\uline{\hfill\mcm@tokens@schoolname\hfill}\makebox[0.66em]{}\par
    \newlength{\mcm@lenB}
    \settowidth{\mcm@lenB}{\mcm@commit@string@membername\hspace{1em}1.}
    \setlength{\mcm@lenB}{\textwidth-\mcm@lenB}
    \mcm@commit@string@membername
    \begin{minipage}[t]{\mcm@lenB}
   	1.\uline{\hspace{1em}\mcm@tokens@membera\hfill} \makebox[0.46em]{}\par
   	2.\uline{\hspace{1em}\mcm@tokens@memberb\hfill} \makebox[0.46em]{}\par
   	3.\uline{\hspace{1em}\mcm@tokens@memberc\hfill} \makebox[0.46em]{}\par
   \end{minipage}\par\vskip1ex
    \mcm@commit@string@supervisorname\uline{\hspace{1em}\mcm@tokens@supervisor\hfill}\makebox[0.66em]{}\par
    （{\kaishu 指导教师签名意味着对参赛队的行为和论文的真实性负责}）
    %{\kaishu\mcm@commit@string@inform\par}
    \vskip2ex
    \newlength{\mcm@lenA}
    \settowidth{\mcm@lenA}{请仔细核对，提交后将不再允许做任何修改。如}% 虽然"日期"刚好在"错误"下面, 但注意"日期"还会缩进, 所以要省去"填写""两字
    \hspace*{\mcm@lenA}\mcm@commit@string@date\hspace{0.5em}\uline{\hfill\hspace{1em}\mcm@tokens@yearinput\hspace{1em}\hfill}%
    \mcm@commit@string@year\uline{\hfill\mcm@tokens@monthinput\hfill}\mcm@commit@string@month%
    \uline{\hfill\mcm@tokens@dayinput\hfill}\mcm@commit@string@day\makebox[1em]{}\par}
    \vskip1ex
    {\kaishu\bfseries\mcm@commit@string@inform\par}
	\vfill
	\null
	\else
	\fi
	\makeothertitle
	}

%% 编号专用页
\def\makeothertitle{%
  \if@mcm@preface
  \par
\newpage
\null
\thispagestyle{empty}
{\zihao{4}\mcm@numberpage@string@headname\\[-5pt]
  \noindent\hspace*{0.67em}\rule{\textwidth-1.33em}{1pt}\par}
\begin{center}
{\zihao{4}\bfseries\heiti \mcm@numberpage@string@titlea\par}
{\vskip1ex\zihao{3}\bfseries\songti \mcm@numberpage@string@titleb\par}
\end{center}\par
{
\zihao{4}
\vskip3em
\hspace*{2em}\mcm@numberpage@string@appraiselog
\par
\newlength{\mcm@lenC}
\setlength{\mcm@lenC}{\textwidth-8.72em}
\setlength{\mcm@lenC}{\mcm@lenC/6}
\newlength{\mcm@lenD}
\settoheight{\mcm@lenD}{\mcm@numberpage@string@reviewer}
\setlength{\mcm@lenD}{\mcm@lenD+2em}
\newlength{\mcm@lenF}
\settoheight{\mcm@lenF}{\mcm@numberpage@string@remarks}
\setlength{\mcm@lenF}{\mcm@lenF+2em}
\newcolumntype{P}{@{}p{\mcm@lenC}@{}}
\hspace*{1.5em}\begin{tabular}{|!{\hspace{4pt}}c!{\hspace{4pt}}|*{6}{P|}}
 \hline
 \rule{0pt}{\mcm@lenD}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@reviewer} & & & & & &  \\\cline{1-7}
 \rule{0pt}{\mcm@lenF}\raisebox{0.6em}[0pt][0pt]{\mcm@numberpage@string@remarks} & & & & & &  \\
 \hline
\end{tabular}\par
\vskip5em
\hspace*{2em}\mcm@numberpage@string@unifiednum
\vskip7em
\hspace*{2em}\mcm@numberpage@string@countrynum}
\vskip7em
{\zihao{-4}\kaishu\bfseries\mcm@numberpage@string@inform\par}
\vfill
\null
\newpage
\null
\setcounter{page}{1}
{\centering \zihao{3}\bfseries \@title\par}
\vskip1ex
\else
\setcounter{page}{1}
{\centering \zihao{3}\bfseries \@title\par}
\vskip1ex
\fi
}

%% 中文标题名称设置
\renewcommand\contentsname{\mcm@cap@contentsname}
\renewcommand\listfigurename{\mcm@cap@listfigurename}
\renewcommand\listtablename{\mcm@cap@listtablename}
\renewcommand\refname{\mcm@cap@refname}
\renewcommand\indexname{\mcm@cap@indexname}
\renewcommand\figurename{\mcm@cap@figurename}
\renewcommand\tablename{\mcm@cap@tablename}
\renewcommand\appendixname{\mcm@cap@appendixname}
\renewcommand\abstractname{\mcm@cap@abstractname}

%% 中文标题格式设置
\setcounter{secnumdepth}{3} % 目录深度

% 节标题格式, 居中, 使用\chinese命令修改计数器
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection\thinspace.\thinspace\arabic{subsubsection}}
\renewcommand\section{\@startsection{section}{1}{\z@}
  {-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\centering\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}


%% 摘要相关
\renewenvironment{abstract}{
\if@twocolumn
		\section*{\abstractname}
	\else
  \begin{center}
	{\zihao{4}\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}
  \end{center}
  \quotation
	\fi}
	{\if@twocolumn\else\endquotation\newpage\null\fi}

\renewenvironment{quotation}
	{\list{}{\listparindent 2em
  \itemindent \listparindent
  \rightmargin\z@
  \leftmargin\z@
  \parsep \z@ \@plus\p@}
	\item\relax}
	{\endlist}

\newcommand\keywords[1]{
	\renewcommand{\mcm@tokens@keywords}{#1}
	\par
	\vskip1ex
	{\noindent\zihao{-4}\heiti\mcm@cap@keywordsname：}~{\mcm@tokens@keywords}
	}


%% 附录相关
\RequirePackage{appendix}
\renewcommand\appendix{
  \newpage
  \par
	\gdef\thesection{\appendixname\@Alph\c@section\ \ }
  }
  
%% 参考文献相关
\renewenvironment{thebibliography}[1]
    {\section*{\refname}
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}
      \list{\@biblabel{\@arabic\c@enumiv}}
            {\settowidth\labelwidth{\@biblabel{#1}}
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000
      \sfcode`\.\@m}
      {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
      \endlist}	

\newcommand*\tihao[1]{
	\renewcommand{\mcm@tokens@tihao}{#1}}
\newcommand*\baominghao[1]{
	\renewcommand{\mcm@tokens@baominghao}{#1}}
\newcommand*\schoolname[1]{
	\renewcommand{\mcm@tokens@schoolname}{#1}}
\newcommand*\membera[1]{
	\renewcommand{\mcm@tokens@membera}{#1}}
\newcommand*\memberb[1]{
	\renewcommand{\mcm@tokens@memberb}{#1}}
\newcommand*\memberc[1]{
	\renewcommand{\mcm@tokens@memberc}{#1}}
\newcommand*\supervisor[1]{
	\renewcommand{\mcm@tokens@supervisor}{#1}}
\newcommand*\yearinput[1]{
	\renewcommand{\mcm@tokens@yearinput}{#1}}
\newcommand*\monthinput[1]{
	\renewcommand{\mcm@tokens@monthinput}{#1}}
\newcommand*\dayinput[1]{
	\renewcommand{\mcm@tokens@dayinput}{#1}}


%% 数学定理相关的常量
\newcommand*{\mcm@cap@definition}{定义}
\newcommand*{\mcm@cap@theorem}{定理}
\newcommand*{\mcm@cap@lemma}{引理}
\newcommand*{\mcm@cap@corollary}{推论}
\newcommand*{\mcm@cap@assumption}{假设}
\newcommand*{\mcm@cap@conjecture}{猜想}
\newcommand*{\mcm@cap@axiom}{公理}
\newcommand*{\mcm@cap@principle}{定律}
\newcommand*{\mcm@cap@problem}{问题}
\newcommand*{\mcm@cap@example}{例}
\newcommand*{\mcm@cap@proof}{证明}
\newcommand*{\mcm@cap@solution}{解}

%%  中文标题名称
\newcommand*{\mcm@cap@contentsname}{目录}
\newcommand*{\mcm@cap@listfigurename}{插图清单}
\newcommand*{\mcm@cap@listtablename}{附表清单}
\newcommand*{\mcm@cap@refname}{参考文献}
\newcommand*{\mcm@cap@indexname}{索引}
\newcommand*{\mcm@cap@figurename}{图}
\newcommand*{\mcm@cap@tablename}{表}
\newcommand*{\mcm@cap@appendixname}{附录}
\newcommand*{\mcm@cap@abstractname}{摘\ \ \ 要}

%%  中文关键字
\newcommand*{\mcm@cap@keywordsname}{关键字}

%% 承诺书中的常量
\newcommand*\mcm@commit@string@headname{赛区评阅编号（由赛区组委会填写）：}
\newcommand*\mcm@commit@string@titlea{\the\year 高教社杯全国大学生数学建模竞赛}
\newcommand*\mcm@commit@string@titleb{承\hspace{1em}诺\hspace{1em}书}
\newcommand\mcm@commit@string@contents{\quotation
我们仔细阅读了《全国大学生数学建模竞赛章程》和《全国大学生数学建模竞赛参赛规则》%
\hspace*{-0.6em}（以下简称为“竞赛章程和参赛规则”，\hspace{-0.2em}可从全国大学生数学建模竞赛网站下载）。

我们完全明白，在竞赛开始后参赛队员不能以任何方式（包括电话、电子邮件、网上咨询等）%
与队外的任何人（包括指导教师）研究、讨论与赛题有关的问题。

我们知道，抄袭别人的成果是违反竞赛章程和参赛规则的，如果引用别人的成果或资料（包括网上资料），
必须按照规定的参考文献的表述方式列出，并在正文引用处予以标注。在网上交
流和下载他人的论文是严重违规违纪行为。

{\bfseries\song 我们以中国大学生名誉和诚信郑重承诺，严格遵守竞赛章程和参赛规则，以保证竞赛的公正、公平性。
如有违反竞赛章程和参赛规则的行为，我们将受到严肃处理。}

我们授权全国大学生数学建模竞赛组委会，可将我们的论文以任何形式进行公开展示%
（包括进行网上公示，在书籍、期刊和其他媒体进行正式或非正式发表等）。
\endquotation
}
\newcommand*\mcm@commit@string@problemnum{我们参赛选择的题号（从A/B/C/D中选择一项填写）：}
\newcommand*\mcm@commit@string@signupnum{我们的报名参赛队号（12位数字全国统一编号）：}
\newcommand*\mcm@commit@string@schoolname{参赛学校（完整的学校全称，不含院系名）：}
\newcommand*\mcm@commit@string@membername{参赛队员 (打印并签名) ：}
\newcommand*\mcm@commit@string@supervisorname{指导教师或指导教师组负责人  (打印并签名)：}
\newcommand\mcm@commit@string@inform{\quotation
\noindent{（\bfseries\kai 请勿改动此页内容和格式。此承诺书打印签名后作为纸质论文的封面，注意电子版论文中不得出现此页。%
以上内容请仔细核对，如填写错误，论文可能被取消评奖资格。）}
\endquotation
}
\newcommand*\mcm@commit@string@date{日期:}
\newcommand*\mcm@commit@string@year{年}
\newcommand*\mcm@commit@string@month{月}
\newcommand*\mcm@commit@string@day{日}
\newcommand*\mcm@commit@string@appraisenum{赛区评阅编号（由赛区组委会评阅前进行编号）：}

%% 编号专用页中的常量
\newcommand*\mcm@numberpage@string@headname{赛区评阅编号（由赛区组委会填写）：}
\newcommand*\mcm@numberpage@string@titlea{\the\year 高教社杯全国大学生数学建模竞赛}
\newcommand*\mcm@numberpage@string@titleb{编\hspace{.5em}号\hspace{.5em}专\hspace{.5em}用\hspace{.5em}页}
\newcommand*\mcm@numberpage@string@appraiselog{赛区评阅记录（可供赛区评阅时使用）：}
\newcommand\mcm@numberpage@string@reviewer{\shortstack{评\\ 阅\\ 人}}
\newcommand\mcm@numberpage@string@remarks{\shortstack{备\\ 注}}
\newcommand*\mcm@numberpage@string@unifiednum{送全国评阅统一编号（由赛区组委会填写）：}
\newcommand*\mcm@numberpage@string@countrynum{全国评阅随机编号（由全国组委会填写）：}
\newcommand\mcm@numberpage@string@inform{\quotation
\noindent（{\bfseries\kai 请勿改动此页内容和格式。此编号专用页仅供赛区和全国评阅使用，参赛队打印后装订到纸质论文的第二页上。
注意电子版论文中不得出现此页。}）
\endquotation
}

%%设置目录格式
% 节的目录格式
\titlecontents{section}[0pt]{\vspace{2mm}\bfseries}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

%% 小节的目录格式
\titlecontents{subsection}[30pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

%小小节的目录格式
\titlecontents{subsubsection}[55pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

\RequirePackage{cite}	% 参考文献宏包
\RequirePackage{colortbl}	% 表格阴影宏包
\RequirePackage{subfig}	% 多子图宏包
\RequirePackage{diagbox}	% 绘制斜线表头

%%% 页脚页眉相关
% \RequirePackage{fancyhdr}	% 页脚页眉宏包

% \pagestyle{fancy}	% 之后所有页面的精细控制页眉页脚开关
% \lhead{}	% 页眉左边
% \chead{}	% 页眉中间  
% \rhead{}	% 页眉右边
% \lfoot{}	%页脚左边
% \cfoot{第 \thepage 页}	% 页脚中间
% \rfoot{}	% 页脚右边
% \renewcommand{\headrulewidth}{0pt}	
% \renewcommand{\footrulewidth}{0pt}


%% 摘要页
\newenvironment{abstractpage}[1]
{\title{#1} 
\maketitle 
\thispagestyle{empty} 
\begin{abstract}}
{\end{abstract}}

%% 目录页
\newcommand{\tocpage}
{\tableofcontents
\thispagestyle{empty}
\newpage
\setcounter{page}{1}}

%% 参考文献页
\newcommand{\bibpage}
{
\bibliography{exam}
\bibliographystyle{is-unsrt}}

%% 交叉引用
\RequirePackage{cleveref}
\crefname{equation}{式}{式}
\crefname{figure}{图}{图}
\crefname{table}{表}{表} 

%% 自定义页码
\usepackage{fancyhdr} 
\usepackage{lastpage}
\pagestyle{fancy}
\cfoot{\thepage/\pageref{LastPage}}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}

\endinput
