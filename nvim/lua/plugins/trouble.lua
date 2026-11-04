-- trouble.nvim v3: the old TroubleToggle/TroubleClose commands were replaced by
-- `:Trouble <mode> [toggle|open|close]`
require "trouble".setup {
    win = { size = 20 },
}

Map("n", "gr", "<Cmd>Trouble lsp_references toggle<CR>")
Map("n", "<Leader>d", "<Cmd>Trouble diagnostics toggle<CR>")
Map("n", "<Leader>q", "<Cmd>Trouble qflist toggle<CR>")
Map("n", "<Leader>Q", "<Cmd>Trouble close<CR>")
Map("n", "<Leader>l", "<Cmd>Trouble loclist toggle<CR>")
