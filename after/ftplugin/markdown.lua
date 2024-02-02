vim.opt_local.spell = true
vim.api.nvim_cmd({ cmd = "set", args = { "suffixesadd+=.md" } }, {})

vim.keymap.set('n', '<leader>nn', function()
    local filepath = '$NOTES_DIR/' .. os.date("%Y%m%d%H%M%S") .. ".md"
    vim.api.nvim_command(":e " .. filepath)
    vim.api.nvim_feedkeys('i#  {#' .. os.date("%Y%m%d%H%M%S") .. '}', 'n', false)
    local place_cursor = vim.api.nvim_replace_termcodes('<ESC>F{h', true, false, true)
    vim.api.nvim_feedkeys(place_cursor, 'm', true)
end, { desc = 'new note' })

vim.keymap.set('n', '<leader>gf', 't)gf')
