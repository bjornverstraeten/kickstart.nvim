return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ["<BS>"] = "actions.parent"
            }
        })
    end,
    keys = {
        { '<leader>o', ':Oil<CR>', noremap = true, silent = true, desc = "open current directory" }
    }
}
