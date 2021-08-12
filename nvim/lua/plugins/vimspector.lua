vim.cmd [[
    let g:vimspector_enable_mappings = 'HUMAN'

    " for normal mode - the word under the cursor
    nmap <Leader>k <Plug>VimspectorBalloonEval

    " for visual mode, the visually selected text
    xmap <Leader>k <Plug>VimspectorBalloonEval

    nnoremap <Leader><F3> :VimspectorReset<CR>
    nnoremap <Leader><F11> <Plug>VimspectorUpFrame
    nnoremap <Leader><F12> <Plug>VimspectorDownFrame
]]
