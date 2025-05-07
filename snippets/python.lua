local ls = require 'luasnip'
local snippet = ls.snippet
local text_node = ls.text_node
local insert_node = ls.insert_node

return {
  snippet({
    trig = 'main',
    dscr = 'make section to run',
  }, {
    text_node 'if __name__ == "__main__":',
  }),

  snippet({
    trig = '"""',
    dscr = 'multilinestring double',
    snippetType = 'autosnippet',
  }, {
    text_node '"""',
    insert_node(1),
    text_node '""',
  }),

  snippet({
    trig = "'''",
    dscr = 'multilinestring single',
    snippetType = 'autosnippet',
  }, {
    text_node "'''",
    insert_node(1),
    text_node "''",
  }),

  snippet({
    trig = 'np',
    dscr = 'import numpy as np',
  }, {
    text_node 'import numpy as np',
  }),

  snippet({
    trig = 'plt',
    dscr = 'import matplotlib.pyplot as plt',
  }, {
    text_node 'import matplotlib.pyplot as plt',
  }),

  snippet({
    trig = 'pd',
    dscr = 'import pandas as pd',
  }, {
    text_node 'import pandas as pd',
  }),

  snippet({
    trig = 'sns',
    dscr = 'import seaborn as sns',
  }, {
    text_node 'import seaborn as sns',
  }),
}
