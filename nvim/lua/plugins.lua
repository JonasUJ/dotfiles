-- Bootstrap packer.nvim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

-- Install plugins
return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Common dep
    use "nvim-lua/plenary.nvim"

    -- Speed
    use "lewis6991/impatient.nvim"

    -- UI
    use "stevearc/dressing.nvim"

    -- Rust
    use "Saecki/crates.nvim"
    use "simrat39/rust-tools.nvim"

    -- Better syntax support
    use "sheerun/vim-polyglot"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "lukas-reineke/indent-blankline.nvim"

    -- File explorer
    use "kyazdani42/nvim-tree.lua"
    use "nvim-telescope/telescope.nvim"

    -- Icons
    use "ryanoasis/vim-devicons"
    use "kyazdani42/nvim-web-devicons"

    -- Quickfix list
    use "folke/trouble.nvim"

    -- Auto closing
    use "windwp/nvim-autopairs"

    use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }

    -- Jump to word
    use "unblevable/quick-scope"

    -- LSP
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    -- Autocomplete
    -- use "hrsh7th/nvim-compe"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "petertriho/cmp-git"

    -- Themes
    use "folke/tokyonight.nvim"

    -- Status Line and Bufferline
    use "NTBBloodbath/galaxyline.nvim"
    use "romgrk/barbar.nvim"

    -- Comments
    use "numToStr/Comment.nvim"

    -- Color on hex codes
    use "norcalli/nvim-colorizer.lua"

    -- Git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- Preview markdown et al.
    use { "iamcco/markdown-preview.nvim", run = "cd app && npm install" }

    -- Debugger
    use "rcarriga/nvim-dap-ui"
    use "mfussenegger/nvim-dap"
end)
