require "utils"

G.mapleader = " "

W.conceallevel = 0 -- So that I can see `` in markdown files
B.fileencoding = "utf-8" -- The encoding written to file
O.encoding = "utf-8" -- The encoding displayed
O.hidden = true -- Required to keep multiple buffers open multiple buffers
O.wrap = false -- Display long lines as just one line
O.ruler = true -- Show the cursor position all the time
O.mouse = "a" -- Enable your mouse
O.splitbelow = true -- Horizontal splits will automatically be below
O.splitright = true -- Vertical splits will automatically be to the right
O.tabstop = 4 -- Insert 4 spaces for a tab
BO.tabstop = 4 -- Insert 4 spaces for a tab
O.shiftwidth = 4 -- Change the number of space characters inserted for indentation
BO.shiftwidth = 4 -- Change the number of space characters inserted for indentation
O.expandtab = true -- Converts tabs to spaces
BO.expandtab = true -- Converts tabs to spaces
O.autoindent = true -- Good auto indent
BO.autoindent = true -- Good auto indent
O.number = true -- Line numbers
WO.number = true -- Line numbers
O.cursorline = true -- Enable highlighting of the current line
O.showtabline = 4 -- Always show tabs
O.updatetime = 300 -- Faster completion
O.timeoutlen = 500 -- By default timeoutlen is 1000 ms
O.clipboard = "unnamedplus" -- Copy paste between vim and everything else
O.path = ".,,**" -- Easier find
O.showmode = false -- Mode is shown on statusline instead
O.scrolloff = 4 -- Scroll offset

vim.cmd "set shortmess+=I" -- disable intro message

vim.cmd "set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case\\ --"
vim.cmd "set grepformat=%f:%l:%c:%m,%f%l%m"

vim.cmd "set noswapfile" -- Swapfiles are annoying when autosaving
vim.cmd "filetype plugin indent on"

vim.cmd "set colorcolumn=101"
vim.cmd "set signcolumn=yes"

G.autosave_ft_ignore = {}
vim.cmd [[
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && index(g:autosave_ft_ignore, &ft) == -1 && &buftype == "" && bufname() != "" | silent write! | doautocmd BufWritePost | endif
augroup END ]]

vim.cmd [[
if has("persistent_undo")
    set undodir=$HOME/.nvim/undodir
    set undofile
endif ]]
