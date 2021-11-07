setlocal define=fn
setlocal path=,,src/**/,tests/**/,benches/**/
" TODO: Include rust source
setlocal tags=./rusty-tags.vi;/

augroup rusty_tags
    autocmd!
    autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir='" . getcwd() . "/'&" | redraw!
augroup END
