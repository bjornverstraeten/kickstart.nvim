local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        generic_sorter = require('mini.fuzzy').get_telescope_sorter,
        file_sorter = require('mini.fuzzy').get_telescope_sorter
    }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

