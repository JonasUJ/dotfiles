local M = {}

function M.on_attach()
    M.mappings()
    M.diagnostics()
end

function M.mappings()
    -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    local opts = { noremap = true, silent = true }
    Map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    Map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    Map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    Map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- Map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    Map("n", "gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    Map("n", "<A-f>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    Map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- Map("n", "<Leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

function M.diagnostics()
    vim.diagnostic.config {
        virtual_text = false,
        virtual_lines = {
            only_current_line = true,
        },
        underline = true,
        update_in_insert = false,
        show_signs = true,
        severity_sort = true,
    }

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return M
