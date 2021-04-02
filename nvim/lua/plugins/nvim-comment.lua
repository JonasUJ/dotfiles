require('nvim_comment').setup()

-- Line comments
vim.api.nvim_set_keymap('n', "<Leader>'", ':CommentToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', "<Leader>'", ':CommentToggle<CR>gv', { noremap = true })
