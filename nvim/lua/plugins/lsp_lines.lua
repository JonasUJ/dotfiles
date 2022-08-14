require "lsp_lines".setup {}

function _G.lsp_lines_toggle()
    vim.diagnostic.config {
        virtual_lines = {
            only_current_line = not vim.diagnostic.config().virtual_lines.only_current_line,
        }
    }
end

Map("n", "<Leader>e", "<cmd>lua _G.lsp_lines_toggle()<CR>", opts)
