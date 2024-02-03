local ls = require("luasnip")
local snip = ls.snippet
local func = ls.function_node

local date = function() return { os.date('%Y-%m-%d') } end

return {
    snip({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        func(date, {}),
    }),
}
