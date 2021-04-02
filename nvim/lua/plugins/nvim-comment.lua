require('nvim_comment').setup()

-- Mappings helper
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Line comments
map('n', "<Leader>'", ':CommentToggle<CR>')
map('v', "<Leader>'", ':CommentToggle<CR>gv')
