O.termguicolors = true
O.syntax = "on"
-- vim.o.t_Co = "256"
O.background = "dark"
G.gruvbox_italic = 1
G.onedark_terminal_italics = 1

G.tokyonight_dark_sidebar = { "trouble", "NvimTree", "packer" }
G.tokyonight_style = "storm"

vim.cmd "colorscheme tokyonight"

vim.cmd [[
augroup ColorColumnTheme
    autocmd!
    autocmd ColorScheme * highlight! link ColorColumn StatusLine
augroup END
]]
