vim.cmd [[
    let g:vimspector_enable_mappings = 'HUMAN'

    " for normal mode - the word under the cursor
    nmap <Leader>k <Plug>VimspectorBalloonEval

    " for visual mode, the visually selected text
    xmap <Leader>k <Plug>VimspectorBalloonEval

    nmap <Leader><F11> <Plug>VimspectorUpFrame
    nmap <Leader><F12> <Plug>VimspectorDownFrame
]]
