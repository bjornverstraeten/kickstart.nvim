vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>cd", ":cd %:h<CR>", { silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
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

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


-- Tab/Shift+tab to indent/dedent
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("n", "<Tab>", "v><C-\\><C-N>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("n", "<S-Tab>", "v<<C-\\><C-N>")
vim.keymap.set("i", "<S-Tab>", "<C-\\><C-N>v<<C-\\><C-N>^i")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Spelling
vim.keymap.set('n', '<leader>s', ':set spell! | echo "Spell " . (&spell ? "on" : "off")<CR>',
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
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Enable personal wiki form everywhere
vim.keymap.set('n', '<leader>ni', ':e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>',
    { silent = true, desc = "go to notes" })

vim.keymap.set('n', '<leader>nn', function()
    local filepath = '$NOTES_DIR/' .. os.date("%Y%m%d%H%M%S") .. ".md"
    vim.api.nvim_command(":e " .. filepath)
    vim.api.nvim_command(":cd $NOTES_DIR")
end, { desc = 'new note' })

vim.keymap.set('n', '<leader>t', ':!ctags -R . <CR>:redraw!<CR>',
    { noremap = true, silent = true, desc = "generate note tags" })
