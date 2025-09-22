% ecustjournal.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecustjournal}[2023/06/22 ECUST Journal Template]

% ==================== 基础设置 ====================
\LoadClass[12pt, a4paper, twoside]{article} % 添加 twoside 双面打印
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}

% ==================== 参考文献设置 ====================
\RequirePackage[%
backend=biber,
style=gb7714-2015,
citestyle=gb7714-2015,
sorting=none
]{biblatex}
\addbibresource{references.bib} % 参考文献文件

% ==================== 页眉页脚设置 ====================
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% ==================== 页面设置（匹配Word模板） ====================
\geometry{
	a4paper,                  % A4纸张 (29.7cm × 21cm)
	left=18mm,                 % 左边界 1.8cm
	right=20mm,                % 右边界 2.0cm  
	top=20mm,                  % 上边界 2.0cm
	bottom=20mm,               % 下边界 2.0cm
	headheight=15pt,           % 页眉高度 1.5cm换算
	headsep=4mm,               % 页眉与正文间距
	footskip=15mm,             % 页脚基线距离 1.5cm
	bindingoffset=5mm,         % 装订线偏移（靠左）
	includeheadfoot            % 包含页眉页脚在版心内
}

% ==================== 行距和缩进设置 ====================
\setstretch{1.5} % 1.5倍行距
\setlength{\parindent}{2em} % 首行缩进2个字符
\RequirePackage{indentfirst} % 确保每个段落都有首行缩进

% ==================== 字体设置 ====================
\setCJKmainfont{SimSun}[BoldFont=SimHei] % 中文字体：宋体，粗体：黑体
\setmainfont{Times New Roman} % 英文字体：Times New Roman

% ==================== 字体字号 ====================
%使用默认字体字号，与word模板字体字号不同

% ==================== 页眉页脚详细设置 ====================
\pagestyle{fancy}
\fancyhf{} % 清除所有页眉页脚

% 常规页面设置 - 双面对称布局
% ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
% 页眉标题填这里
\fancyhead[C]{\small 这里见ecustjournal.cls，我进行了！标注} % 文章标题
\fancyhead[LE]{\small \thepage} % 偶数页左上角：页码
\fancyhead[RO]{\small \thepage} % 奇数页右上角：页码

% 首页特殊样式 - 双细线页眉
\fancypagestyle{firstpage}{
	\fancyhf{} % 清除首页页眉页脚
	% 首页页眉：学报名称（中英文）
	\fancyhead[C]{\small 华东理工大学学报（自然科学版）\\ Journal of East China University of Science and Technology (Natural Science Edition)}
	% 首页页码：右上角
	\fancyhead[RO]{\small \thepage}
	% 设置双细线
	\renewcommand{\headrule}{%
		\hrule width\headwidth height0.6pt % 上线（较粗）
		\vskip1pt % 线间距
		\hrule width\headwidth height0.3pt % 下线（较细）
	}
	\renewcommand{\headrulewidth}{0pt} % 禁用默认的单线
	
%！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
	% 首页页脚 - 添加左下角信息
	\fancyfoot[L]{
		\begin{minipage}[t]{0.7\textwidth} % 控制宽度
			%\footnotesize 默认脚注字号
			\scriptsize
			%\tiny %更小字号
			\rule[0.5ex]{0.75\linewidth}{0.4pt}\\ % 注脚上方横线，0.75/0.4是横线长宽
			收稿日期: \today 或使用相关宏包更改样式为yyyy-mm-dd\\
			基金项目: 基金项目类别(项目编号) 资助项目\\
			作者简介: 言书懿(2002-), 男, 至ecustjournal.cls更改，进行了！标注\\
			通讯作者: 田老师, E-mail: *@ecust.edu.cn
		\end{minipage}
	}
}

% ==================== 标题格式设置 ====================
% 所有标题靠左对齐
\titleformat{\section}{\bfseries\large}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries}{\thesubsubsection}{1em}{}

% ==================== DOI 位置调整 ====================
% 将DOI放在右上角，靠近页眉
\newcommand{\doi}[1]{%
	\hfill % 推到右侧
	\textbf{DOI:} #1\\
	\vspace{0.5em} % 调整与下文间距
}

% ==================== 自定义命令 ====================
% 中文标题、作者、单位
\newcommand{\chinesetitle}[1]{\begin{center}\bfseries\large #1\end{center}}
\newcommand{\chineseauthor}[1]{\begin{center}#1\end{center}}
\newcommand{\chineseaffiliation}[1]{\begin{center}(#1)\end{center}}

% 英文标题、作者、单位
\newcommand{\englishtitle}[1]{\begin{center}\bfseries\large #1\end{center}}
\newcommand{\englishauthor}[1]{\begin{center}#1\end{center}}
\newcommand{\englishaffiliation}[1]{\begin{center}(#1)\end{center}}

% ==================== 摘要格式调整 ====================
% 摘要内容与"摘要"字样在同一行
\renewenvironment{abstract}{%
	\vspace{0.5em}
	\noindent\textbf{摘要: } % "摘要"与内容在同一行
	\ignorespaces % 忽略接下来的空格
}{%
	\par
	\vspace{0.5em}
}

% 关键词和分类号
\newcommand{\keywords}[1]{\noindent\textbf{关键词:} #1}
\newcommand{\enkeywords}[1]{\noindent\textbf{Key words:} #1}
\newcommand{\cclcode}[1]{\noindent\textbf{中图分类号:} #1\hspace{2em}} % 添加2em间隔
\newcommand{\literaturemark}[1]{\noindent\textbf{文献标志码:} #1}

% ==================== 引言环境定义 ====================
% 定义引言环境，"引言"与内容在同一行
\newenvironment{introduction}{%
	\vspace{2\baselineskip} % 前面空约两行间距
	\noindent % 取消首行缩进
	\textbf{引言: } % 加粗的"引言"字样，添加冒号和空格
	\ignorespaces % 忽略接下来的空格
}{%
	\par
	\vspace{0.5em}
}

% ==================== 数学相关宏包 ====================
\RequirePackage{amsmath}      % 基础数学公式
\RequirePackage{amssymb}      % 数学符号
\RequirePackage{amsthm}       % 定理环境
\RequirePackage{bm}           % 粗体数学符号
\RequirePackage{mathtools}    % 数学工具扩展
\RequirePackage{mathrsfs}     % 花体字母

% ==================== 定理及图表环境设置 ====================
\theoremstyle{definition}     % 定义类环境样式
\newtheorem{definition}{定义}[section]   % 自动编号：定义2.1
\newtheorem{property}{性质}[section]    % 自动编号：性质2.1  
\newtheorem{theorem}{定理}[section]      % 自动编号：定理2.1
\newtheorem{lemma}{引理}[section]        % 引理环境
\newtheorem{corollary}{推论}[section]    % 推论环境
\newtheorem{proposition}{命题}[section]  % 命题环境

\theoremstyle{remark}         % 注记类环境样式
\newtheorem*{remark}{注}       % 注环境（不编号）
\newtheorem*{example}{例}      % 例环境（不编号）

% 设置证明环境为中文
\renewenvironment{proof}[1][\textbf{证明}]{\par
	\noindent#1:\quad
	\ignorespaces
}{%
	\hfill$\square$\par
}

% ==================== 算法环境设置 ====================
\RequirePackage{algorithm}     % 算法环境
\RequirePackage{algpseudocode} % 算法伪代码
\RequirePackage{algorithmicx}  % 算法扩展

% 算法样式设置
\floatname{algorithm}{算法}    % 将"Algorithm"改为"算法"
\renewcommand{\algorithmicrequire}{\textbf{输入:}}    % 输入格式
\renewcommand{\algorithmicensure}{\textbf{输出:}}     % 输出格式
\renewcommand{\algorithmiccomment}[1]{\hfill\text{// #1}} % 注释格式

% ==================== 表格和图表设置 ====================
\RequirePackage{booktabs}      % 三线表
\RequirePackage{array}         % 表格扩展
\RequirePackage{multirow}      % 多行表格
\RequirePackage{graphicx}      % 图形支持
\RequirePackage{caption}       % 标题格式
\RequirePackage{threeparttable}% 表格注释支持
\RequirePackage{subcaption}    % 子图表

% ==================== 图表标题中英文双语设置 ====================
% 使用bicaption宏包支持中英文双语标题
\RequirePackage{bicaption}     % 中英文双语标题

% 设置中英文标题格式
\captionsetup[figure][bi-first]{name=图} % 中文图标题
\captionsetup[figure][bi-second]{name=Fig.} % 英文图标题
\captionsetup[table][bi-first]{name=表} % 中文表标题
\captionsetup[table][bi-second]{name=Table} % 英文表标题

% 定义中英文双语标题命令
\newcommand{\figbicaption}[2]{%
	\bicaption{#1}{#2} % 中文标题、英文标题
}

\newcommand{\tabbicaption}[2]{%
	\bicaption{#1}{#2} % 中文标题、英文标题
}

% ==================== 表格数字对齐设置 ====================
\RequirePackage{siunitx}
\sisetup{
	detect-mode,
	group-digits = false,
	input-signs = + -,
	input-symbols = ( ) [ ] * + - ×,
	round-mode = places,
	round-precision = 2
}

% ==================== 其他实用宏包 ====================
\RequirePackage{verbatim}      % 代码环境
\RequirePackage{hyperref}      % 超链接（建议最后加载）
\RequirePackage{cleveref}      % 智能引用

% ==================== 数学运算符定义 ====================
% 定义常用的数学运算符
\DeclareMathOperator{\GF}{GF}          % Galois域
\DeclareMathOperator{\REDC}{REDC}      % REDC算法
\DeclareMathOperator{\SQUA}{SQUA}      % 平方算法
\DeclareMathOperator{\INVE}{INVE}      % 求逆算法

% 常用数学符号简写
\newcommand{\modn}{\bmod}               % 模运算
\newcommand{\GFp}{\mathbb{F}_p}         % 有限域F_p
\newcommand{\polyring}{\GFp[x]}         % 多项式环
\newcommand{\redc}{\mathrm{REDC}}       % REDC算法
\newcommand{\squa}{\mathrm{SQUA}}       % 平方算法
\newcommand{\inve}{\mathrm{INVE}}       % 求逆算法

% ==================== 超链接设置（最后加载） ====================
\AtEndOfClass{
	\RequirePackage{hyperref}
	\hypersetup{
		colorlinks=true,
		linkcolor=blue,
		citecolor=red,
		urlcolor=magenta,
		pdftitle={ECUST Journal Template},
		pdfauthor={Author Name}
	}
}

% ==================== 多行注释 ====================
% 定义注释环境
\RequirePackage{comment} % 加载comment宏包

% ==================== 编译优化设置 ====================
% 减少过满和欠满的警告
\clubpenalty=10000
\widowpenalty=10000
\brokenpenalty=10000

% 允许稍微灵活的页面布局
\emergencystretch=1em
\tolerance=500

% ==================== 自定义环境 ====================
% 定义示例环境
\newenvironment{exampleenv}[1][]{
	\begin{trivlist}
		\item[\hskip\labelsep \bfseries 例#1:]
	}{\end{trivlist}}

% 定义注意环境
\newenvironment{noteenv}[1][]{
	\begin{trivlist}
		\item[\hskip\labelsep \bfseries 注#1:]
	}{\end{trivlist}}

% ==================== 文档结束 ====================
\endinput