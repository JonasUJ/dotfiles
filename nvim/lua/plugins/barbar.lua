local opts = { silent = true }

-- Move to previous/next
Map("n", "<A-,>", ":BufferPrevious<CR>", opts)
Map("n", "<A-.>", ":BufferNext<CR>", opts)

-- Re-order to previous/next
Map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
Map("n", "<A->>", ":BufferMoveNext<CR>", opts)

-- Goto buffer in position...
Map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
Map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
Map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
Map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
Map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
Map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
Map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
Map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
Map("n", "<A-9>", ":BufferLast<CR>", opts)

-- Close buffer
Map("n", "<A-c>", ":BufferClose<CR>", opts)

-- Pin buffer
Map("n", "<A-p>", ":BufferPin<CR>", opts)

-- Magic buffer-picking mode
Map("n", "<A-b>", ":BufferPick<CR>", opts)

G.bufferline = {
    animation = false,
    closable = false,
    auto_hide = true,
    icons = "both",
    icon_separator_active = "▌",
    icon_separator_inactive = "▏",
    icon_pinned = "車"
}
