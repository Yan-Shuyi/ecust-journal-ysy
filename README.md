# LaTeX 科技论文排版指南

## 📖 概述

本指南基于华东理工大学学报（自然科学版）模板，旨在帮助科研工作者快速掌握 LaTeX 科技论文排版。通过 LaTeX 学习与实践，我将本科论文从 Word 迁移到 LaTeX，并总结了这份实用指南。

## 🏗️ 推荐文件结构

```
论文项目/
├── main.tex              # 主文档（必需）
├── ecustjournal.cls      # 文档类配置（必需）
├── references.bib        # 参考文献数据库（必需）
├── sections/             # 章节文件（推荐）
│   ├── abstract.tex      # 中英文摘要
│   ├── introduction.tex  # 引言
│   ├── methodology.tex   # 研究方法
│   ├── results.tex       # 实验结果
│   └── conclusion.tex    # 结论
├── figures/              # 图片文件夹（推荐）
│   ├── figure1.pdf       # 矢量图推荐格式
│   └── figure2.eps       # 矢量图格式
├── build.bat             # 一键构建脚本（可选）
├── build_fast.bat        # 快速构建脚本（可选）
├── clean.bat             # 清理脚本（可选）
└── compile.bat           # 编译脚本（可选）
```

## ⚙️ 环境配置

### 必需软件安装
1. **TeX Live** - LaTeX 发行版 https://www.tug.org/texlive/
2. **TeXstudio** - LaTeX 编辑器 https://www.texstudio.org/

### 推荐编辑器设置
- **编译器**：XeLaTeX（支持中文）
- **参考文献工具**：Biber
- **编码**：UTF-8

## 🎯 LaTeX 核心优势

### 与传统 Word 对比
| 特性 | LaTeX | Word |
|------|-------|------|
| 数学公式 | ⭐⭐⭐⭐⭐ 专业排版 | ⭐⭐⭐ 基础支持 |
| 参考文献 | ⭐⭐⭐⭐⭐ 自动管理 | ⭐⭐⭐ 手动维护 |
| 格式一致性 | ⭐⭐⭐⭐⭐ 模板控制 | ⭐⭐ 容易错乱 |
| 大型文档 | ⭐⭐⭐⭐⭐ 高效管理 | ⭐⭐⭐ 性能下降 |
| 学习曲线 | ⭐⭐ 需要学习 | ⭐⭐⭐⭐⭐ 即学即用 |

### 核心概念理解
- **文档类 (.cls)** → 定义整体样式和格式
- **主文件 (.tex)** → 组织内容结构  
- **宏包** → 扩展功能（如数学公式、图表等）
- **编译** → 将源代码转换为PDF

## 📝 基础编译流程

### 手动编译（推荐初学者掌握）
```bash
# 第一步：生成基础文件
xelatex main.tex

# 第二步：处理参考文献
biber main

# 第三步：处理交叉引用
xelatex main.tex

# 第四步：最终编译确保正确
xelatex main.tex
```

### 批处理文件（可选便捷方式）
项目提供了几个批处理文件**作为可选工具**，方便快速操作：

| 文件 | 功能 | 使用场景 |
|------|------|----------|
| `compile.bat` | 智能编译 | 支持完整/快速编译模式 |
| `clean.bat` | 清理临时文件 | 解决编译问题或提交前清理 |
| `build.bat` | 一键构建 | 生成最终发布版本 |
| `build_fast.bat` | 快速构建 | 日常开发测试 |

**注意**：这些批处理文件是**完全可选的**，您也可以直接使用编辑器或手动命令完成所有操作。

## 🚀 快速入门步骤

1. **安装环境**：TeX Live + TeXstudio
2. **获取模板**：下载 `ecustjournal.cls` 和示例文件
3. **组织内容**：按模块化结构组织您的论文
4. **编写内容**：专注内容而非格式
5. **编译调试**：按顺序编译，逐步解决错误
6. **最终优化**：调整细节，生成最终PDF

## 💡 实用技巧

### 1. 数学公式排版
```latex
% 行内公式
Einstein 的质能方程 $E = mc^2$ 是物理学的基础。

% 行间公式（带编号）
\begin{equation}
    \label{eq:matrix}
    \mathbf{A} = \begin{bmatrix}
        a_{11} & a_{12} \\
        a_{21} & a_{22}
    \end{bmatrix}
\end{equation}
```

### 2. 参考文献管理
```latex
% 引用文献
Montgomery 算法\cite{montgomery1985}在密码学中广泛应用。

% 生成参考文献列表
\printbibliography
```

### 3. 图表排版
```latex
\begin{table}[htbp]
    \caption{算法性能对比}
    \begin{tabular}{lcc}
        \toprule
        算法 & 时间(ms) & 内存(MB) \\
        \midrule
        算法A & 12.5 & 256 \\
        算法B & 8.7 & 198 \\
        \bottomrule
    \end{tabular}
    \label{tab:performance}
\end{table}
```

## 🌟 学习建议

### 推荐学习路径
1. **基础阶段**：掌握文档结构、基本命令、数学公式
2. **进阶阶段**：学习参考文献管理、图表排版、自定义命令
3. **高级阶段**：了解模板定制、宏包开发、自动化脚本

### 常见问题解决
- **中文支持**：确保使用 XeLaTeX 编译器
- **参考文献**：使用 Biber + Biblatex 组合
- **编译错误**：从第一个错误开始解决，逐条处理
- **格式问题**：坚持使用模板，避免随意修改样式

## 📚 资源推荐

### 学习资源
- https://www.overleaf.com/learn
- https://www.tug.org/texlive/
- https://github.com/ecustjournal/template

### 社区支持
- https://tex.stackexchange.com/
- http://www.ctex.org/
- https://www.latexstudio.net/

## 🔧 关于批处理文件的说明

项目提供的批处理文件（`.bat`）是**完全可选的辅助工具**，主要目的是：

1. **简化操作**：一键执行常见任务
2. **提高效率**：减少重复命令输入
3. **标准化流程**：确保编译顺序正确

**但请注意**：
- 这些脚本不是使用 LaTeX 的必需品
- 您完全可以手动执行所有操作
- 脚本可能需要根据您的系统环境进行调整
- 如果遇到问题，直接使用手动命令通常更容易排查

## 💖 致谢

感谢华东理工大学学报提供的标准模板，特别感谢元宝在 LaTeX 学习过程中提供的技术指导和支持。

---

**作者**：言书懿  
**联系方式**：yanshuyi@ecust.edu.cn  
**许可证**：MIT License  
**更新日期**：2023年6月

> 💡 提示：本指南将持续更新，欢迎反馈和建议！

## 📥 开始使用

1. **下载模板**：获取最新的 `ecustjournal.cls` 文件
2. **安装软件**：安装 TeX Live 和 TeXstudio
3. **创建项目**：按照推荐结构组织您的论文
4. **开始写作**：专注于内容创作，让 LaTeX 处理格式问题

---

*这份指南源于实际的项目迁移经验，从 Word 到 LaTeX 的转换虽然需要学习成本，但带来的排版质量和效率提升是值得的。祝您 LaTeX 之旅愉快！*