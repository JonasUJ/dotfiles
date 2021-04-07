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

    -- Better syntax support
    use 'sheerun/vim-polyglot'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- Workspaces and autosave
    use 'thaerkh/vim-workspace'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Auto closing
    use 'tmsvg/pear-tree'

    -- Jump to word
    use 'unblevable/quick-scope'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'kabouzeid/nvim-lspinstall'

    -- Autocomplete
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'

    -- Themes
    use 'jschmold/sweet-dark.vim'
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'

    -- Icons
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'

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

    -- Rust
    use 'rust-lang/rust.vim'
end)
