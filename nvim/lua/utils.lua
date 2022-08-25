O = vim.o
BO = vim.bo
WO = vim.wo
W = vim.w
B = vim.b
G = vim.g

-- Mappings helper
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end
