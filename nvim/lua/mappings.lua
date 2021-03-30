-- Mappings helper
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Use alt + hjkl to resize windows
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
map('v', '<A-j>', ':m \'>+1<CR>gv=gv')
map('v', '<A-k>', ':m \'<-2<CR>gv=gv')

-- Delele instead of cut
map('n', 'd', '"dd')
map('v', 'd', '"dd')

-- Easy CAPS
map('i', '<C-u>', '<ESC>g~iwgi')
map('n', '<C-u>', 'g~iw<Esc>')

-- TAB in general mode will move to text buffer
-- map('n', '<TAB>', ':bnext<CR>')
-- SHIFT-TAB will go back
-- map('n', '<S-TAB>', ':bprevious<CR>')

-- Alternate way to save
map('n', '<C-s>', ':w<CR>')
-- <TAB>: completion.
map('i', '<expr><TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"')

-- Better tabbing
map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', '<S-TAB>', '<gv')
map('v', '<TAB>', '>gv')

-- I use ^W-c to close windows and :q, ZZ, and ZQ to close the whole editor
map('n', 'ZZ', ':wqa<CR>')
map('n', 'ZQ', ':qa<CR>')

-- Better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<Esc>', '<C-\\><C-n>')

-- Open buffers
map('n', '<leader>b', ':ls<CR>:b<SPACE>')

-- Use [[ and ]] when { and } are not on the first column (from motions.txt)
map('i', '[[', '?{<CR>w99[{')
map('i', '][', '/}<CR>b99]}')
map('i', ']]', 'j0[[%/{<CR>')
map('i', '[]', 'k$][%?}<CR>')

-- Highlight all occurrences of word under the cursor
map('n', '<A-*>', '*``')
map('n', '<A-#>', '#``')

-- Line comments
map('i', "<Leader>'", ':CommentToggle<CR>')
map('n', "<Leader>'", ':CommentToggle<CR>')
map('v', "<Leader>'", ':CommentToggle<CR>gv')
