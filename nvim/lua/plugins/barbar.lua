-- Move to previous/next
Map("n", "<A-,>", ":BufferPrevious<CR>")
Map("n", "<A-.>", ":BufferNext<CR>")

-- Re-order to previous/next
Map("n", "<A-<>", ":BufferMovePrevious<CR>")
Map("n", "<A->>", ":BufferMoveNext<CR>")

-- Goto buffer in position...
Map("n", "<A-1>", ":BufferGoto 1<CR>")
Map("n", "<A-2>", ":BufferGoto 2<CR>")
Map("n", "<A-3>", ":BufferGoto 3<CR>")
Map("n", "<A-4>", ":BufferGoto 4<CR>")
Map("n", "<A-5>", ":BufferGoto 5<CR>")
Map("n", "<A-6>", ":BufferGoto 6<CR>")
Map("n", "<A-7>", ":BufferGoto 7<CR>")
Map("n", "<A-8>", ":BufferGoto 8<CR>")
Map("n", "<A-9>", ":BufferLast<CR>")

-- Close buffer
Map("n", "<A-c>", ":BufferClose<CR>")

-- Pin buffer
Map("n", "<A-p>", ":BufferPin<CR>")

-- Magic buffer-picking mode
Map("n", "<A-b>", ":BufferPick<CR>")

G.bufferline = {
    animation = false,
    closable = false,
    auto_hide = true,
    icons = "both",
    icon_separator_active = "▌",
    icon_separator_inactive = "▏",
    icon_pinned = "車"
}
