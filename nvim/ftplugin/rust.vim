setlocal define=fn
setlocal path=,,src/**/,tests/**/,benches/**/

augroup rusty_tags
    autocmd!
    autocmd BufEnter *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
    autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir='" . getcwd() . "/'&"
augroup END
