-- Mappings helper
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Use alt + k/j to move lines up/down
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
map('v', '<A-j>', ':m \'>+1<CR>gv=gv')
map('v', '<A-k>', ':m \'<-2<CR>gv=gv')

-- Use specific regisers for actions the would otherwise use ""
map('n', 'd', '"dd')
map('v', 'd', '"dd')
map('n', 'c', '"cc')
map('v', 'c', '"cc')
map('n', 'x', '"xx')
map('v', 'x', '"xx')

-- This makes more sense on non-US keyboards
map('n', ';', ',')
map('n', ',', ';')

-- Better tabbing
map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', '<S-TAB>', '<gv')
map('v', '<TAB>', '>gv')

-- I use ^W-c to close windows and ZZ/ZQ to close the whole editor
map('n', 'ZZ', ':wqa<CR>')
map('n', 'ZQ', ':qa<CR>')

-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>')

-- Open buffers
map('n', '<leader>b', ':ls<CR>:b<SPACE>')

-- Use [[ and ]] when { and } are not on the first column (from motion.txt)
map('n', '[[', '?{<CR>w99[{')
map('n', '][', '/}<CR>b99]}')
map('n', ']]', 'j0[[%/{<CR>')
map('n', '[]', 'k$][%?}<CR>')

-- Highlight all occurrences of word under the cursor
map('n', '<A-*>', '*``')
map('n', '<A-#>', '#``')

-- Cycle quickfix/location list
map('n', '<A-n>', ':cnext<CR>')
map('n', '<A-N>', ':cprev<CR>')
map('n', '<A-m>', ':lnext<CR>')
map('n', '<A-M>', ':lprev<CR>')

-- Grep selection
map('n', '<leader>f', ':silent grep <cword><CR> :Trouble quickfix<CR>')
map('v', '<leader>f', '"fy :silent grep <C-r>f<CR> :Trouble quickfix<CR>')
