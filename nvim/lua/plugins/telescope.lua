local actions = require "telescope.actions"

require "telescope".setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["jk"] = actions.close,
                ["kj"] = actions.close,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                ["<C-e>"] = actions.preview_scrolling_down,
                ["<C-y>"] = actions.preview_scrolling_up,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-k>"] = actions.preview_scrolling_up,
            }
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        git_files = {
            theme = "dropdown",
        },
        tags = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
        grep_string = {
            theme = "dropdown",
        },
        lsp_references = {
            theme = "dropdown",
        },
        lsp_implementations = {
            theme = "dropdown",
        },
        lsp_definitions = {
            theme = "dropdown",
        },
        lsp_type_definitions = {
            theme = "dropdown",
        },
        lsp_dynamic_workspace_symbols = {
            theme = "dropdown",
        },
        diagnostics = {
            theme = "ivy",
        },
    },
    extensions = {
        -- ...
    }
}

local M = {}

local function no_preview()
    return require("telescope.themes").get_dropdown({
        width = 0.8,
        previewer = false,
    })
end

function M.project_files()
    local opts = no_preview()
    local ok = pcall(require 'telescope.builtin'.git_files, opts)
    if not ok then require 'telescope.builtin'.find_files(opts) end
end

-- Files
Map("n", "<Leader><Tab>", "<Cmd>lua require'plugins/telescope'.project_files()<CR>")

-- Symbols
Map("n", "<Leader>fg", "<Cmd>lua require'telescope.builtin'.live_grep()<CR>")
Map("v", "<Leader>fg", "<Cmd>lua require'telescope.builtin'.grep_string()<CR>")
Map("n", "<Leader>ft", "<Cmd>lua require'telescope.builtin'.tags()<CR>")

-- LSP
Map("n", "<Leader>fr", "<Cmd>lua require'telescope.builtin'.lsp_references()<CR>")
Map("n", "<Leader>fe", "<Cmd>lua require'telescope.builtin'.diagnostics()<CR>")
Map("n", "<Leader>fi", "<Cmd>lua require'telescope.builtin'.lsp_implementations()<CR>")
Map("n", "<Leader>fd", "<Cmd>lua require'telescope.builtin'.lsp_definitions()<CR>")
Map("n", "<Leader>fD", "<Cmd>lua require'telescope.builtin'.lsp_type_definitions()<CR>")
Map("n", "<Leader>fs", "<Cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols()<CR>")

-- Git
Map("n", "<Leader>gc", "<Cmd>lua require'telescope.builtin'.git_commits()<CR>")
Map("n", "<Leader>gb", "<Cmd>lua require'telescope.builtin'.git_bcommits()<CR>")
Map("n", "<Leader>gs", "<Cmd>lua require'telescope.builtin'.git_status()<CR>")
Map("n", "<Leader>gv", "<Cmd>lua require'telescope.builtin'.git_branches()<CR>")

return M
