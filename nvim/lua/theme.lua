O.termguicolors = true
O.syntax = "on"

-- Mocha when background is dark, Latte when light (toggled with <A-o> below)
require("catppuccin").setup {
    flavour = "auto",
    background = {
        light = "latte",
        dark = "mocha",
    },
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

vim.cmd("colorscheme " .. "catppuccin")
