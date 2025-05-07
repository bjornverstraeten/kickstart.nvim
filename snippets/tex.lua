local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local fmta = require('luasnip.extras.fmt').fmta
local snip = ls.snippet
local insert = ls.insert_node
local rep = extras.rep

return {
  snip(
    { trig = 'ff', dscr = "Expands 'ff' into '\frac{}{}'" },
    fmta('\\frac{<>}{<>}', {
      insert(1),
      insert(2),
    })
  ),
  snip(
    {
      trig = 'ugent',
      namr = 'latex_ugent',
      dscr = 'Create a latex template using ugent.sty',
    },
    fmta(
      [[
            \documentclass[a4paper]{article}
            \usepackage{ugent}

            \begin{document}


            \title{<>}
            \author{<>}
            \date{<>}

            \thispagestyle{firstpage}
            \maketitle

            <>

            \end{document}
            ]],
      { insert(1), insert(2), insert(3), insert(4) }
    )
  ),
  snip(
    {
      trig = 'beg',
      dscr = 'Create an environment',
      snippetType = 'autosnippet',
    },
    fmta(
      [[
            \begin{<>}
            <>
            \end{<>}
            ]],
      { insert(1), insert(2), rep(1) }
    )
  ),
}
