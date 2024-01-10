-- Specify modules
require('mini.pairs').setup({
    mappings = {
        ["`"] = false,
    },
})
require('mini.comment').setup()
require('mini.fuzzy').setup()
require('mini.bufremove').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
