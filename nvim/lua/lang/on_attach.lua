local M = {}

local severity = vim.diagnostic.severity

function M.setup()
    M.diagnostics()

    -- Buffer-local LSP mappings, set whenever any server attaches
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_mappings", { clear = true }),
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            M.mappings(ev.buf, client)
        end,
    })
end

function M.mappings(bufnr, client)
    local function opts(desc) return { buffer = bufnr, silent = true, desc = desc } end

    Map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    Map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    Map("n", "K", vim.lsp.buf.hover, opts("Hover"))
    Map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    -- Code actions on <Leader>ca (not gc, which is Neovim's built-in comment operator)
    Map({ "n", "x" }, "<Leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    Map("n", "<A-f>", function() vim.lsp.buf.format { async = true } end, opts("Format"))
    Map("n", "<F2>", vim.lsp.buf.rename, opts("Rename"))

    -- rust-analyzer (via rustaceanvim) has richer hover and code actions
    if client and client.name == "rust-analyzer" then
        Map("n", "K", function() vim.cmd.RustLsp { "hover", "actions" } end, opts("Hover actions"))
        Map({ "n", "x" }, "<Leader>ca", function() vim.cmd.RustLsp "codeAction" end, opts("Code action"))
    end
end

function M.diagnostics()
    vim.diagnostic.config {
        virtual_text = false,
        virtual_lines = false,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                [severity.ERROR] = " ",
                [severity.WARN] = " ",
                [severity.HINT] = " ",
                [severity.INFO] = " ",
            },
            numhl = {
                [severity.ERROR] = "DiagnosticSignError",
                [severity.WARN] = "DiagnosticSignWarn",
                [severity.HINT] = "DiagnosticSignHint",
                [severity.INFO] = "DiagnosticSignInfo",
            },
        },
    }

    -- Diagnostics as lines under the code (built into Nvim 0.11+, replaces lsp_lines.nvim)
    -- <Leader>e: only for the current line, <Leader>E: everywhere; press again to hide
    local function toggle(current_line)
        return function()
            local val = vim.diagnostic.config().virtual_lines
            local shown_current = type(val) == "table" and val.current_line == true
            local shown_all = val == true or (type(val) == "table" and not val.current_line)

            if (current_line and shown_current) or (not current_line and shown_all) then
                vim.diagnostic.config { virtual_lines = false }
            elseif current_line then
                vim.diagnostic.config { virtual_lines = { current_line = true } }
            else
                vim.diagnostic.config { virtual_lines = true }
            end
        end
    end

    Map("n", "<Leader>e", toggle(true), { desc = "Diagnostics as lines (current line)" })
    Map("n", "<Leader>E", toggle(false), { desc = "Diagnostics as lines (all)" })
end

return M
