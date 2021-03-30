-- Mappings helper
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', { silent = true })
map('n', '<A-.>', ':BufferNext<CR>', { silent = true })

-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', { silent = true })
map('n', '<A->>', ':BufferMoveNext<CR>', { silent = true })

-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', { silent = true })
map('n', '<A-2>', ':BufferGoto 2<CR>', { silent = true })
map('n', '<A-3>', ':BufferGoto 3<CR>', { silent = true })
map('n', '<A-4>', ':BufferGoto 4<CR>', { silent = true })
map('n', '<A-5>', ':BufferGoto 5<CR>', { silent = true })
map('n', '<A-6>', ':BufferGoto 6<CR>', { silent = true })
map('n', '<A-7>', ':BufferGoto 7<CR>', { silent = true })
map('n', '<A-8>', ':BufferGoto 8<CR>', { silent = true })
map('n', '<A-9>', ':BufferLast<CR>', { silent = true })

-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', { silent = true })

-- Magic buffer-picking mode
map('n', '<A-p>', '   :BufferPick<CR>', { silent = true })

-- NOTE: If barbar's option dict isn't created yet, create it
vim.cmd "let bufferline = get(g:, 'bufferline', {})"

-- Enable/disable auto-hiding the tab bar when there is a single buffer
vim.g.bufferline.auto_hide = true

-- Enable/disable icons
-- if set to 'numbers', will show buffer index in the tabline
-- if set to 'both', will show buffer index and icons in the tabline
vim.g.bufferline.icons = 'both'
