augroup gotags
    autocmd!
    autocmd BufEnter *.go :setlocal tags=./gotags.vi
    autocmd BufWritePost *.go :silent! exec "!gotags -silent -f gotags.vi (fd -e go)"
augroup END
