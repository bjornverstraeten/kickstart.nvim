local snippet = require("luasnip").snippet
local text_node = require("luasnip").text_node
local insert_node = require("luasnip").insert_node
return {
    snippet(
        {
            trig = '```',
            dscr = "multilinestring double",
            snippetType = "autosnippet"
        },
        {
            text_node({ '```', '' }),
            insert_node(1),
            text_node({ '', '``' }),
        }
    ),
}
