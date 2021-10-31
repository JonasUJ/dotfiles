local o = vim.o
local bo = vim.bo
local wo = vim.wo
local w = vim.w
local b = vim.b
local g = vim.g

g.mapleader = " "

w.conceallevel = 0 -- So that I can see `` in markdown files
b.fileencoding = "utf-8" -- The encoding written to file
o.encoding = "utf-8" -- The encoding displayed
o.hidden = true -- Required to keep multiple buffers open multiple buffers
o.wrap = false -- Display long lines as just one line
o.ruler = true -- Show the cursor position all the time
o.mouse = "a" -- Enable your mouse
o.splitbelow = true -- Horizontal splits will automatically be below
o.splitright = true -- Vertical splits will automatically be to the right
o.tabstop = 4 -- Insert 4 spaces for a tab
bo.tabstop = 4 -- Insert 4 spaces for a tab
o.shiftwidth = 4 -- Change the number of space characters inserted for indentation
bo.shiftwidth = 4 -- Change the number of space characters inserted for indentation
o.expandtab = true -- Converts tabs to spaces
bo.expandtab = true -- Converts tabs to spaces
o.autoindent = true -- Good auto indent
bo.autoindent = true -- Good auto indent
o.number = true -- Line numbers
wo.number = true -- Line numbers
o.cursorline = true -- Enable highlighting of the current line
o.showtabline = 4 -- Always show tabs
o.updatetime = 300 -- Faster completion
o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
o.path = ".,,**" -- Easier find
o.showmode = false -- Mode is shown on statusline instead

vim.cmd "set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case\\ --"
vim.cmd "set grepformat=%f:%l:%c:%m,%f%l%m"

vim.cmd "set noswapfile" -- Swapfiles are annoying when autosaving
vim.cmd "filetype plugin indent on" -- Swapfiles are annoying when autosaving

g.polyglot_disabled = {'autoindent'}

g.workspace_autosave_always = false -- Disable autosave, even when not in a workspace
-- ... and then re-enable it on fewer event types
g.autosave_ft_ignore = {}
vim.cmd [[
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && index(g:autosave_ft_ignore, &ft) == -1 && &buftype == "" | silent write | endif
augroup END ]]

g.pear_tree_smart_openers = 1
g.pear_tree_smart_closers = 1
g.pear_tree_smart_backspace = 1
