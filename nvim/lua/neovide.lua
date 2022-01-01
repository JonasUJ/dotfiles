vim.o.guifont = "CaskaydiaCove NF:h15"

vim.api.nvim_set_keymap('n', '<F11>', ':let g:neovide_fullscreen = !g:neovide_fullscreen<CR>', {noremap=true, silent=true})
