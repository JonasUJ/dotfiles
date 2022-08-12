require "indent_blankline".setup {
    buftype_exclude = { "terminal" },
    filetype_exclude = { "help", "startify", "dashboard", "packer", "neogitstatus", "NVIMTREE" },
    char = "▏",
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    show_current_context = true,
}
