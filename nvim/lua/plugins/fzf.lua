-- fzf-lua: fuzzy finder (replaces telescope.nvim and telescope-ui-select).
-- Needs the `fzf` program (brew install fzf).
local fzf = require "fzf-lua"

-- Window shapes matching the old Telescope themes
local dropdown = { height = 0.6, width = 0.6, row = 0.25, preview = { layout = "vertical", vertical = "down:50%" } }
local ivy = { row = 1, col = 0, width = 1, height = 0.4, preview = { layout = "horizontal", horizontal = "right:50%" } }
local no_preview = { width = 0.8, height = 0.5, preview = { hidden = true } }

fzf.setup {
    winopts = dropdown,
    keymap = {
        -- `true` keeps fzf-lua's default keys; the rest are the old Telescope keys
        builtin = { -- builtin (Neovim) previewer
            true,
            ["<C-e>"] = "preview-down",
            ["<C-j>"] = "preview-down",
            ["<C-y>"] = "preview-up",
            ["<C-k>"] = "preview-up",
        },
        fzf = { -- fzf itself and its native previewers (git status, commits)
            true,
            ["tab"] = "down",
            ["shift-tab"] = "up",
            ["ctrl-e"] = "preview-down",
            ["ctrl-j"] = "preview-down",
            ["ctrl-y"] = "preview-up",
            ["ctrl-k"] = "preview-up",
        },
    },
}

-- vim.ui.select (code actions, etc.): code actions in a small popup at the cursor
fzf.register_ui_select(function(ui_opts)
    if ui_opts.kind == "codeaction" then
        return { winopts = { relative = "cursor", row = 1, col = 0, height = 0.3, width = 0.5, preview = { hidden = true } } }
    end
    return { winopts = { height = 0.4, width = 0.5, preview = { hidden = true } } }
end)

-- Git files inside a repository, all files otherwise
local function project_files()
    if vim.fs.root(vim.fn.getcwd(), ".git") then
        fzf.git_files { winopts = no_preview }
    else
        fzf.files { winopts = no_preview }
    end
end

local function opts(desc) return { desc = desc } end

-- Files
Map("n", "<Leader><Tab>", project_files, opts("Project files"))

-- Symbols
Map("n", "<Leader>fg", fzf.live_grep, opts("Live grep"))
Map("v", "<Leader>fg", fzf.grep_visual, opts("Grep selection"))
Map("n", "<Leader>ft", fzf.tags, opts("Tags"))

-- LSP
Map("n", "<Leader>fr", fzf.lsp_references, opts("LSP references"))
Map("n", "<Leader>fe", function() fzf.diagnostics_workspace { winopts = ivy } end, opts("Workspace diagnostics"))
Map("n", "<Leader>fi", fzf.lsp_implementations, opts("LSP implementations"))
Map("n", "<Leader>fd", fzf.lsp_definitions, opts("LSP definitions"))
Map("n", "<Leader>fD", fzf.lsp_typedefs, opts("LSP type definitions"))
Map("n", "<Leader>fs", fzf.lsp_live_workspace_symbols, opts("Workspace symbols"))

-- Git
Map("n", "<Leader>gc", fzf.git_commits, opts("Git commits"))
Map("n", "<Leader>gb", fzf.git_bcommits, opts("Git commits (buffer)"))
Map("n", "<Leader>gs", fzf.git_status, opts("Git status"))
Map("n", "<Leader>gv", fzf.git_branches, opts("Git branches"))
