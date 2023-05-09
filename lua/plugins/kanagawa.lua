return {
    --colorscheme
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup
    priority = 1000,
    config = function()
	    vim.cmd("colorscheme kanagawa")
    end,
}
