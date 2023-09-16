local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

return {
    snip({
            trig = "ln",
            namr = "markdown_link",
            dscr = "Create markdown link [txt](url)"
        },
        {
            text('['),
            insert(1),
            text(']('),
            insert(2),
            text(')')
        }),

    snip(
        {
            trig = '```',
            dscr = "multilinestring double",
            snippetType = "autosnippet"
        },
        {
            text({ '```', '' }),
            insert(1),
            text({ '', '``' }),
        }
    )
}
