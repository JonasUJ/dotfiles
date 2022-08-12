require("nvim_comment").setup()

-- Line comments
Map("n", "<Leader>\"", ":CommentToggle<CR>", { noremap = true })
Map("v", "<Leader>\"", ":CommentToggle<CR>gv", { noremap = true })
