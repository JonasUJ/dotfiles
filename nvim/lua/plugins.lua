-- Plugins are managed by Neovim's built-in package manager (vim.pack, Nvim 0.12+).
--   :lua vim.pack.update()           update all plugins (review, then :write to apply)
--   :lua vim.pack.del({ "name" })    remove a plugin from disk
-- Exact revisions are pinned in nvim-pack-lock.json next to init.lua; commit it.

local function gh(repo) return "https://github.com/" .. repo end

-- Build steps that run after a plugin is installed or updated.
-- Must be registered before vim.pack.add() so they also run on first install.
vim.api.nvim_create_autocmd("PackChanged", {
    group = vim.api.nvim_create_augroup("pack_hooks", { clear = true }),
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if kind ~= "install" and kind ~= "update" then return end

        if name == "nvim-treesitter" then
            if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd("TSUpdate")
        end
    end,
})

vim.pack.add({
    -- Rust
    gh "Saecki/crates.nvim",
    { src = gh "mrcjkb/rustaceanvim", version = vim.version.range("^6") },

    -- Better syntax support
    { src = gh "nvim-treesitter/nvim-treesitter", version = "main" },
    gh "lukas-reineke/indent-blankline.nvim",

    -- File explorer: tree on <Leader>t, oil (edit a directory like a buffer) on -
    gh "nvim-tree/nvim-tree.lua",
    gh "stevearc/oil.nvim",

    -- Fuzzy finder (files, grep, tags, LSP, git, vim.ui.select); needs `fzf`
    gh "ibhagwan/fzf-lua",

    -- Shows available keys after a prefix such as <Leader>
    gh "folke/which-key.nvim",

    -- Icons
    gh "nvim-tree/nvim-web-devicons",

    -- Quickfix list
    gh "folke/trouble.nvim",

    -- Auto closing
    gh "windwp/nvim-autopairs",

    -- Folding
    gh "kevinhwang91/promise-async",
    gh "kevinhwang91/nvim-ufo",

    -- Jump to word
    gh "unblevable/quick-scope",

    -- LSP
    gh "mason-org/mason.nvim",
    gh "mason-org/mason-lspconfig.nvim",
    gh "neovim/nvim-lspconfig",

    -- Autocomplete (tagged releases ship a prebuilt fuzzy matcher)
    { src = gh "saghen/blink.cmp", version = vim.version.range("^1") },
    gh "Kaiser-Yang/blink-cmp-git",

    -- Themes
    { src = gh "catppuccin/nvim", name = "catppuccin" },

    -- Status Line and Bufferline
    gh "nvim-lualine/lualine.nvim",

    -- Color on hex codes
    gh "catgoose/nvim-colorizer.lua",

    -- Git
    gh "tpope/vim-fugitive",
    gh "lewis6991/gitsigns.nvim",

    -- Render markdown (headings, lists, code blocks, tables) inside the buffer
    gh "MeanderingProgrammer/render-markdown.nvim",

    -- Debugger
    gh "mfussenegger/nvim-dap",
    gh "nvim-neotest/nvim-nio",
    gh "rcarriga/nvim-dap-ui",
})
