local palette = {
    base00 = "#1F1F28",
    base01 = "#1F1F28", -- original#2A2A37
    base02 = "#223249",
    base03 = "#727169",
    base04 = "#C8C093",
    base05 = "#DCD7BA",
    base06 = "#938AA9",
    base07 = "#363646",
    base0A = "#C34043",
    base09 = "#FFA066",
    base08 = "#DCA561",
    base0B = "#98BB6C",
    base0C = "#7FB4CA",
    base0D = "#7E9CD8",
    base0E = "#957FB8",
    base0F = "#D27E99"
}

require("mini.base16").setup({
    palette = palette,
    use_cterm = true,
})

vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#727169", bg = "#2A2A37" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#DCA561", bg = "#1F1F28" })
vim.g.colors_name = "kanagawa"
