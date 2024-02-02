vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set({ "i", "n" }, ",,", "<Esc>:w<CR>")
vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>", { silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "i", function()
    if #vim.fn.getline(".") == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true })

-- completion
vim.keymap.set("i", ";;", "<c-x><c-f>")
vim.keymap.set("i", ";]", "<c-x><c-]>")

-- pasting and yanking
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Spelling
vim.keymap.set('n', '<leader>s', ':setlocal spell! | echo "Spell " . (&spell ? "on" : "off")<CR>',
    { silent = true, desc = 'Toggle [S]pelling' })

-- Diagnostic keymaps
vim.g.diagnostics_visible = true
function Toggle_diagnostics()
    if vim.g.diagnostics_visible then
        vim.g.diagnostics_visible = false
        vim.diagnostic.disable()
        print('Diagnostics off')
    else
        vim.g.diagnostics_visible = true
        vim.diagnostic.enable()
        print('Diagnostics on')
    end
end

vim.keymap.set('n', '<leader>d', Toggle_diagnostics, { desc = "Toggle diagnostic on/off" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

vim.keymap.set('n', '<leader>t', ':!ctags -R . <CR>:redraw!<CR>',
    { noremap = true, silent = true, desc = "generate note tags" })

-- move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})
