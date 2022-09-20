require "gitsigns".setup {
    signs = {
        add          = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change       = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete       = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete    = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    keymaps = {
        noremap = true,
        buffer = true,

        ["n <leader>hn"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
        ["n <leader>hN"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

        ["n <leader>hs"] = "<cmd>lua require'gitsigns'.stage_hunk()<CR>",
        ["n <leader>hu"] = "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>",
        ["n <leader>hr"] = "<cmd>lua require'gitsigns'.reset_hunk()<CR>",
        ["n <leader>hR"] = "<cmd>lua require'gitsigns'.reset_buffer()<CR>",
        ["n <leader>hp"] = "<cmd>lua require'gitsigns'.preview_hunk()<CR>",
        ["n <leader>hb"] = "<cmd>lua require'gitsigns'.blame_line()<CR>",
        ["n <leader>hS"] = "<cmd>lua require'gitsigns'.stage_buffer()<CR>",
        ["n <leader>hU"] = "<cmd>lua require'gitsigns'.reset_buffer_index()<CR>",
    },
    current_line_blame = true,
}
