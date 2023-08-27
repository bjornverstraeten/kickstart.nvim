vim.opt.conceallevel = 3
-- vim.cmd [[syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal]]
-- vim.cmd [[syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends]]

vim.keymap.set('n', '<leader>ny', ':let @" =expand("%:t")<CR>',
    { noremap = true, silent = true, desc = "yank filename of note" })

vim.keymap.set('n', '<leader>nt', ':!ctags -R . <CR>:redraw!<CR>',
    { noremap = true, silent = true, desc = "generate note tags" })

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
