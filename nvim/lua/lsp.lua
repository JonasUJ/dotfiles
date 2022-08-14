require "plugins.nvim-cmp"
require "plugins.lsp_signature"
require "plugins.lsp_lines"

require "nvim-lsp-installer".setup()
local lspconfig = require "lspconfig"

O.completeopt = "menuone,noselect"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require "cmp_nvim_lsp".update_capabilities(capabilities)

for _, server in pairs(require"nvim-lsp-installer.servers".get_installed_servers()) do
    server = server.name

    local status, s = pcall(require, "lang." .. server)

    if status then
        server = s
    else
        server = lspconfig[server]
    end

    server.setup {
        on_attach = require "lang.on_attach".on_attach,
        capabilities = capabilities,
    }
end
