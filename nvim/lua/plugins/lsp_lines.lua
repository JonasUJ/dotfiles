require "lsp_lines".setup {}

local function toggle(single)
    return function()
        local val = vim.diagnostic.config().virtual_lines

        if type(val) == "boolean" then
            if val then
                vim.diagnostic.config {
                    virtual_lines = false,
                }
            elseif single then
                vim.diagnostic.config {
                    virtual_lines = {
                        only_current_line = true,
                    },
                }
            else
                vim.diagnostic.config {
                    virtual_lines = true,
                }
            end
        else
            vim.diagnostic.config {
                virtual_lines = not single,
            }
        end
    end
end

Map("n", "<Leader>e", toggle(true), opts)
Map("n", "<Leader>E", toggle(false), opts)
