require "plugins.lsp_lines"

local capabilities = require "cmp_nvim_lsp".default_capabilities()

require "mason".setup {}
require "mason-lspconfig".setup {}
require "mason-lspconfig".setup_handlers {
    function (server)
        local status, s = pcall(require, "lang." .. server)

        if status then
            server = s
        else
            server = require "lspconfig"[server]
        end

        server.setup {
            on_attach = require "lang.on_attach".on_attach,
            capabilities = capabilities,
        }
    end
}
