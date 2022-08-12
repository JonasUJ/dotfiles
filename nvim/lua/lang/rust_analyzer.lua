local M = {}

-- Set LLDB_EXT_PATH to extension install location
-- Usually:
-- ~/.vscode/extensions/vadimcn.vscode-lldb-1.6.9/
local codelldb_path = vim.env.LLDB_EXT_PATH .. "/adapter/codelldb"
local liblldb_path = vim.env.LLDB_EXT_PATH .. "/lldb/lib/liblldb.so"

local function on_attach()
    require "lang.on_attach".on_attach()

    -- Mappings
    local opts = { noremap = true, silent = true }
    Map("n", "K", "<Cmd>RustHoverActions<CR>", opts)
    Map("n", "gc", "<Cmd>RustCodeAction<CR>", opts)
    Map("n", "<A-f>", "<Cmd>RustFmt<CR>", opts)
end

function M.setup(opts)
    require "rust-tools".setup {
        server = {
            on_attach = on_attach,
            capabilities = opts.capabilities,
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
        },
        dap = {
            adapter = require("rust-tools.dap").get_codelldb_adapter(
                codelldb_path, liblldb_path)
        },
    }

    require("rust-tools").inlay_hints.enable()
end

return M
