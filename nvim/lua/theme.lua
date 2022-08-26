O.termguicolors = true
O.syntax = "on"

G.tokyonight_dark_sidebar = { "trouble", "NvimTree", "packer" }
G.tokyonight_style = "night"

vim.cmd "colorscheme tokyonight"

vim.cmd [[
augroup ColorColumnTheme
    autocmd!
    autocmd ColorScheme * highlight! link ColorColumn StatusLine
augroup END
]]
