O.termguicolors = true
O.syntax = "on"

G.tokyonight_dark_sidebar = { "trouble", "NvimTree", "packer" }

vim.cmd "colorscheme tokyonight-night"

vim.cmd [[
augroup ColorColumnTheme
    autocmd!
    autocmd ColorScheme * highlight! link ColorColumn StatusLine
augroup END
]]
