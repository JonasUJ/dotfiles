require "lsp_lines".setup {}

function _G.lsp_lines_toggle()
    local val = vim.diagnostic.config().virtual_lines

    if type(val) == "boolean" then
        if val then
            vim.diagnostic.config {
                virtual_lines = false,
            }
        else
            vim.diagnostic.config {
                virtual_lines = {
                    only_current_line = true,
                },
            }
        end
    else
        vim.diagnostic.config {
            virtual_lines = true,
        }
    end
end

Map("n", "<Leader>e", "<cmd>lua _G.lsp_lines_toggle()<CR>", opts)
