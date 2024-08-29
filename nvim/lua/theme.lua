local config = require "tokyonight.config"

O.termguicolors = true
O.syntax = "on"

G.tokyonight_dark_sidebar = { "trouble", "NvimTree", "packer" }

require("tokyonight").setup {
    style = "night",
}

vim.cmd [[
augroup ColorColumnTheme
    autocmd!
    autocmd ColorScheme * highlight! link ColorColumn StatusLine
augroup END
]]

Map("n", "<A-o>", function ()
    if vim.o.background == "light" then
        vim.o.background = "dark"
    else
        vim.o.background = "light"
    end
end)

vim.cmd("colorscheme " .. "tokyonight")
