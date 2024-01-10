local snippet = require("luasnip").snippet
local text_node = require("luasnip").text_node
local insert_node = require("luasnip").insert_node

return {
    snippet(
        {
            trig = "np",
            dscr = "import numpy as np"
        },
        {
            text_node("import numpy as np")
        }
    ),

    snippet(
        {
            trig = "main",
            dscr = "make section to run"
        },
        {
            text_node('if __name__ == "__main__":')
        }
    ),

    snippet(
        {
            trig = '"""',
            dscr = "multilinestring double",
            snippetType = "autosnippet"
        },
        {
            text_node('"""'),
            insert_node(1),
            text_node('""')
        }
    ),

    snippet(
        {
            trig = "'''",
            dscr = "multilinestring single",
            snippetType = "autosnippet"
        },
        {
            text_node("'''"),
            insert_node(1),
            text_node("''")
        }
    ),

    snippet(
        {
            trig = "plt",
            dscr = "import matplotlib.pyplot as plt"
        },
        {
            text_node("import matplotlib.pyplot as plt")
        }
    ),
    snippet(
        {
            trig = "sns",
            dscr = "import seaborn as sns"
        },
        {
            text_node("import seaborn as sns")
        }
    )
}
