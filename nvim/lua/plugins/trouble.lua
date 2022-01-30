require("trouble").setup {
    height = 20,
}

-- Mappings helper
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', 'gr', '<CMD>TroubleToggle lsp_references<CR>')
map('n', '<Leader>d', '<CMD>TroubleToggle workspace_diagnostics<CR>')
map('n', '<Leader>q', '<CMD>TroubleToggle quickfix<CR>')
map('n', '<Leader>Q', '<CMD>TroubleClose<CR>')
map('n', '<Leader>l', '<CMD>TroubleToggle loclist<CR>')
