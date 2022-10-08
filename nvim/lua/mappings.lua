-- Use alt + k/j to move lines up/down
Map("n", "<A-j>", ":m .+1<CR>==")
Map("n", "<A-k>", ":m .-2<CR>==")
Map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
Map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
Map("v", "<A-j>", ":m \">+1<CR>gv=gv")
Map("v", "<A-k>", ":m \"<-2<CR>gv=gv")

-- This makes more sense on non-US keyboards
Map("n", ";", ",")
Map("n", ",", ";")

-- Better tabbing
Map("v", "<", "<gv")
Map("v", ">", ">gv")
Map("v", "<S-TAB>", "<gv")
Map("v", "<TAB>", ">gv")

-- I use ^W-c to close windows and ZZ/ZQ to close the whole editor
Map("n", "ZZ", ":wqa<CR>")
Map("n", "ZQ", ":qa<CR>")

-- Better window navigation
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
Map("n", "<C-c>", "<C-w>c")

-- Window resize
Map("n", "<A-S-h>", "<Cmd>vertical resize -2<CR>")
Map("n", "<A-S-j>", "<Cmd>resize -2<CR>")
Map("n", "<A-S-k>", "<Cmd>resize +2<CR>")
Map("n", "<A-S-l>", "<Cmd>vertical resize +2<CR>")

-- Buffers
Map("n", "<Leader>bd", "<Cmd>bd!<CR>")

-- Exit terminal mode
Map("t", "<Esc>", "<C-\\><C-n>")

-- Open buffers
Map("n", "<leader>b", ":ls<CR>:b<SPACE>")

-- Use [[ and ]] when { and } are not on the first column (from motion.txt)
Map("n", "[[", "?{<CR>w99[{")
Map("n", "][", "/}<CR>b99]}")
Map("n", "]]", "j0[[%/{<CR>")
Map("n", "[]", "k$][%?}<CR>")

-- Highlight all occurrences of word under the cursor
Map("n", "<A-*>", "*``")
Map("n", "<A-#>", "#``")

-- Cycle quickfix/location list
Map("n", "<A-n>", ":cnext<CR>")
Map("n", "<A-N>", ":cprev<CR>")
Map("n", "<A-m>", ":lnext<CR>")
Map("n", "<A-M>", ":lprev<CR>")

-- Grep selection
-- Map("n", "<leader>f", ":silent grep <cword><CR> :Trouble quickfix<CR>")
-- Map("v", "<leader>f", ""fy :silent grep <C-r>f<CR> :Trouble quickfix<CR>")
