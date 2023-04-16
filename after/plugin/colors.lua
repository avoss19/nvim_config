require('nightfox').setup({
    disable_background = true,
    transparent_backound = true,
    term_colors = false,
});

function ColorMyPencils(color)
    color = color or "nightfox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", fg = "none" })

    -- neo-tree transparent background
    vim.api.nvim_set_hl(0, "NeotreeNormal", { bg = "none", fg = "none" })
end

ColorMyPencils()
