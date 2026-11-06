-- rustaceanvim (successor to rust-tools.nvim). It starts rust-analyzer for Rust
-- buffers on its own; mappings come from the LspAttach handler in lang/on_attach.lua.
-- Debugging uses codelldb from :Mason, which rustaceanvim detects automatically.
vim.g.rustaceanvim = {
    server = {
        -- rustup component add rust-analyzer
        cmd = { "rust-analyzer" },
        capabilities = require "blink.cmp".get_lsp_capabilities(),
        on_attach = function(_, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        default_settings = {
            ["rust-analyzer"] = {
                check = {
                    overrideCommand = {
                        "cargo",
                        "clippy",
                        "--workspace",
                        "--message-format=json",
                        "--all-targets",
                        "--all-features",
                    },
                },
                inlayHints = {
                    lifetimeElisionHints = {
                        enable = "always",
                    },
                    reborrowHints = {
                        enable = "always",
                    },
                },
            },
        },
    },
}
