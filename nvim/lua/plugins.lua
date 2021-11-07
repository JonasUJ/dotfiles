-- Bootstrap packer.nvim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- Install plugins
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Rust
    use { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'simrat39/rust-tools.nvim', requires = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
            'mfussenegger/nvim-dap'
        }}

    -- Better syntax support
    use 'sheerun/vim-polyglot'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'lukas-reineke/indent-blankline.nvim'

    -- Workspaces and autosave
    use 'thaerkh/vim-workspace'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    use { 'nvim-telescope/telescope.nvim', requires = {
            'nvim-lua/plenary.nvim'
        }}

    -- Icons
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

    -- Quickfix list
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }

    -- Auto closing
    use 'tmsvg/pear-tree'

    -- Jump to word
    use 'unblevable/quick-scope'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'kabouzeid/nvim-lspinstall'
    use "ray-x/lsp_signature.nvim"

    -- Autocomplete
    -- use 'hrsh7th/nvim-compe'
    use { 'hrsh7th/nvim-cmp', requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        }}

    -- Themes
    use 'jschmold/sweet-dark.vim'
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use 'folke/tokyonight.nvim'

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    use 'romgrk/barbar.nvim'

    -- Comments
    use 'terrortylor/nvim-comment'

    -- Color on hex codes
    use 'norcalli/nvim-colorizer.lua'

    -- Git
    use 'tpope/vim-fugitive'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- Preview markdown et al.
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}

    -- Debugger
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
end)
