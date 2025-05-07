local ls = require 'luasnip'
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

return {
  snip({
    trig = 'ln',
    namr = 'markdown_link',
    dscr = 'Create markdown link [txt](url)',
  }, {
    text '[',
    insert(1),
    text '](',
    insert(2),
    text ')',
  }),

  snip({
    trig = '```',
    dscr = 'multiline code block',
    snippetType = 'autosnippet',
  }, {
    text { '```', '' },
    insert(1),
    text { '', '``' },
  }),
}
