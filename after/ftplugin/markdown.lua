vim.opt.conceallevel = 3

vim.keymap.set('n', '<leader>ny', ':let @" =expand("%:t")<CR>',
    { noremap = true, silent = true, desc = "yank filename of note" })

vim.keymap.set('n', '<leader>gd', function()
    local key = vim.fn.expand("<cword>")
    vim.api.nvim_cmd({ cmd = 'cd', args = { '$REF_DIR' } }, {})
    vim.api.nvim_cmd({ cmd = 'tj', args = { key } }, {})
end)


vim.keymap.set('n', '<leader>yf', function()
    local opts = {
        attach_mappings = function(_, map)
            map("n", "<CR>", function(prompt_bufnr)
                -- filename is available at entry[1]
                local entry = require("telescope.actions.state").get_selected_entry()
                require("telescope.actions").close(prompt_bufnr)
                local filename = entry[1]
                -- Insert filename in current cursor position
                vim.cmd('normal i' .. filename)
            end)
            return true
        end,
    }
    require("telescope.builtin").find_files(opts)
end)

-- navigation
vim.keymap.set('n', '<CR>', function()
    local line = vim.fn.getline(".")
    local cur = vim.api.nvim_win_get_cursor(0)

    for i = cur[2] + 1, #line - 1 do
        if string.sub(line, i, i + 1) == "](" then
            vim.api.nvim_win_set_cursor(0, { cur[1], cur[2] + i - cur[2] + 1 })
            if vim.fn.expand("<cfile>:e") == "md" then
                vim.api.nvim_feedkeys('gf', 'n', false)
            else
                vim.cmd "call jobstart(['xdg-open', expand('<cfile>:p')], {'detach': v:true})"
            end
            return
        elseif i ~= cur[2] + 1 and string.sub(line, i, i) == "[" then
            break;
        end
    end

    for i = cur[2] + 1, 2, -1 do
        if string.sub(line, i - 1, i) == "](" then
            vim.api.nvim_win_set_cursor(0, { cur[1], i })
            if vim.fn.expand("<cfile>:e") == "md" then
                vim.api.nvim_feedkeys('gf', 'n', false)
            else
                vim.cmd "call jobstart(['xdg-open', expand('<cfile>:p')], {'detach': v:true})"
            end
            return
        elseif i ~= cur[2] + 1 and string.sub(line, i, i) == ")" then
            break
        end
    end
end, { buffer = true })

vim.keymap.set('n', '<BS>', function()
    if vim.fn.bufname('%') ~= "index.md" then
        vim.cmd 'bd'
    end
end, { buffer = true })

vim.keymap.set("n", "<Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)')<CR>", { buffer = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)', 'b')<CR>", { buffer = true })
