require "trouble".setup {
    height = 20,
}

Map("n", "gr", "<CMD>TroubleToggle lsp_references<CR>")
Map("n", "<Leader>d", "<CMD>TroubleToggle workspace_diagnostics<CR>")
Map("n", "<Leader>q", "<CMD>TroubleToggle quickfix<CR>")
Map("n", "<Leader>Q", "<CMD>TroubleClose<CR>")
Map("n", "<Leader>l", "<CMD>TroubleToggle loclist<CR>")
