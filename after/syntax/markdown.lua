vim.cmd [[syn match fileId "{#\d\+}" contained conceal]]
vim.cmd [[syn region markdownH1 matchgroup=markdownH1Delimiter start=/ \{,3}#\s/ end=/#*\s*$/  contained oneline keepend contains=@markdownInline,markdownAutomaticLink,fileId]]

-- latex math
vim.cmd [[syn match latexmathSpace "\s" contained conceal]]
vim.cmd [[syn match latexMathSymbol "\\gamma" contained conceal cchar=γ]]
vim.cmd [[syn match latexMathSymbol "\\lambda" contained conceal cchar=λ]]
vim.cmd [[syn match latexMathSymbol "\\alpha" contained conceal cchar=α]]
vim.cmd [[syn match latexMathSymbol "\\cdot" contained conceal cchar=·]]
vim.cmd [[syn match latexMathSymbol "\\sum" contained conceal cchar=∑]]
vim.cmd [[syn match latexMathSymbol "\\Delta" contained conceal cchar=Δ]]

vim.cmd [[syn region latexInlineMath matchgroup=latexMathDelimiter start="\$" end="\$"  concealends contains=latexMathSymbol,latexmathSpace]]
vim.cmd [[syn region latexDisplayMath matchgroup=latexDisplayMathDelimiter start="\$\$" end="\$\$"  concealends contains=latexMathSymbol,latexmathSpace]]
vim.cmd [[hi clear Conceal]]
