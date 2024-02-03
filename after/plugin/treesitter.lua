require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "javascript", "python", "c", "lua", "vim", "vimdoc", "query" },
    ignore_install = {},
    modules = {},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "latex", "markdown" },
    },
}
