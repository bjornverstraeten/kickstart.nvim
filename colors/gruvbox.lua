local palette = {
    base00 = "#282828",
    base01 = "#282828", -- original = "#3c3836"
    base02 = "#504945",
    base03 = "#665c54",
    base04 = "#bdae93",
    base05 = "#d5c4a1",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#fabd2f", -- yellow
    base09 = "#fe8019", -- orange
    base0A = "#d3869b", -- purple
    base0B = "#b8bb26", -- green
    base0C = "#8ec07c", -- aqua/c
    base0D = "#83a598", -- blue
    base0E = "#fb4934", -- red
    base0F = "#d65d0e", -- brown
}

require("mini.base16").setup({
    palette = palette,
    use_cterm = true,
})

vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#665c54", bg = "#3c3836" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fe8019", bg = "#282828" })
vim.g.colors_name = "gruvbox"
