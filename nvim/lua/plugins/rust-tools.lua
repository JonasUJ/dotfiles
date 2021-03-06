-- Set LLDB_EXT_PATH to extension install location
-- Usually:
-- ~/.vscode/extensions/vadimcn.vscode-lldb-1.6.9/
local codelldb_path = vim.env.LLDB_EXT_PATH .. '/adapter/codelldb'
local liblldb_path = vim.env.LLDB_EXT_PATH .. '/lldb/lib/liblldb.so'

require('rust-tools.inlay_hints').set_inlay_hints()

require'rust-tools'.setup {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
    server = {
        -- cargo install ra_ap_rust-analyzer
        cmd = { "rust-analyzer" },
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    allFeatures = true,
                    overrideCommand = {
                        "cargo",
                        "clippy",
                        "--workspace",
                        "--message-format=json",
                        "--all-targets",
                        "--all-features",
                    },
                },
            },
        },
        on_attach = function (client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

            -- Mappings
            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'K', '<Cmd>RustHoverActions<CR>', opts)
            buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            buf_set_keymap('n', 'gc', '<Cmd>RustCodeAction<CR>', opts)
            buf_set_keymap('n', '<A-f>', '<Cmd>RustFmt<CR>', opts)
            buf_set_keymap('n', '<F2>', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
            buf_set_keymap('n', '<Leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
            -- buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

            vim.lsp.handlers['textDocument/publishDiagnostic'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = {
                        spacing = 4,
                    },
                    underline = true,
                    update_in_insert = false,
                    show_signs = true,
                    severity_sort = true,
                })

            local signs = { Error = "??? ", Warn = "??? ", Hint = "??? ", Info = "??? " }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end


            require "lsp_signature".on_attach({
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    hint_prefix = "param ",
                    hint_enable = false,
                    handler_opts = {
                        border = "none"
                    }
                }, bufnr)
        end
    }
}

