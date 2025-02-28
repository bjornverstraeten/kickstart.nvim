local config = function()
    require("oil").setup({
        skip_confirm_for_simple_edits = true,
        keymaps = {
            ["<BS>"] = "actions.parent"
        }
    })
end

return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { '<leader>o', ':Oil<CR>', noremap = true, silent = true, desc = "open current directory" }
    },
    config = config,
}
