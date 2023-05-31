function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#665c54", bg = "#3c3836" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fe8019", bg = "#282828" })
end

ColorMyPencils()
