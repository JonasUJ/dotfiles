local config = require "tokyonight.config"

O.termguicolors = true
O.syntax = "on"

G.tokyonight_dark_sidebar = { "trouble", "NvimTree", "packer" }

local light_theme = "tokyonight-day"
local dark_theme = "tokyonight-night"

vim.cmd("colorscheme " .. dark_theme)

vim.cmd [[
augroup ColorColumnTheme
    autocmd!
    autocmd ColorScheme * highlight! link ColorColumn StatusLine
augroup END
]]

Map("n", "<A-o>", function ()
    if config.is_day() then
        vim.cmd("colorscheme " .. dark_theme)
    else
        vim.cmd("colorscheme " .. light_theme)
    end
end)
