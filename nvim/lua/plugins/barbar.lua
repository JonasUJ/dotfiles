-- Mappings helper
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>')
map('n', '<A-.>', ':BufferNext<CR>')

-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>')
map('n', '<A->>', ':BufferMoveNext<CR>')

-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>')
map('n', '<A-2>', ':BufferGoto 2<CR>')
map('n', '<A-3>', ':BufferGoto 3<CR>')
map('n', '<A-4>', ':BufferGoto 4<CR>')
map('n', '<A-5>', ':BufferGoto 5<CR>')
map('n', '<A-6>', ':BufferGoto 6<CR>')
map('n', '<A-7>', ':BufferGoto 7<CR>')
map('n', '<A-8>', ':BufferGoto 8<CR>')
map('n', '<A-9>', ':BufferLast<CR>')

-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>')

-- Pin buffer
map('n', '<A-p>', ':BufferPin<CR>')

-- Magic buffer-picking mode
map('n', '<A-b>', ':BufferPick<CR>')

vim.g.bufferline = {
  animation = false,
  closable = false,
  auto_hide = true,
  icons = 'both',
  icon_separator_active = '▌',
  icon_separator_inactive = '▏',
  icon_pinned = '車'
}

