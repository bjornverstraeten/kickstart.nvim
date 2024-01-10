require("oil").setup({
    skip_confirm_for_simple_edits = false,
    keymaps = {
        ["<BS>"] = "actions.parent"
    }
})
vim.keymap.set("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true, desc = "open current directory" })
