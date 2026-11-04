-- LSP uses Neovim's built-in config API (vim.lsp.config / vim.lsp.enable, Nvim 0.11+).
-- nvim-lspconfig only supplies the per-server defaults (its lsp/*.lua files), and
-- mason-lspconfig enables every server installed through :Mason.

require "lang.on_attach".setup()
require "lang.rust"

-- Completion capabilities for every server are added by blink.cmp (plugins/blink.lua);
-- put other defaults for all servers in vim.lsp.config("*", { ... }) here.

require "mason".setup {}
require "mason-lspconfig".setup {
    automatic_enable = {
        -- rustaceanvim starts and manages rust-analyzer itself
        exclude = { "rust_analyzer" },
    },
}
