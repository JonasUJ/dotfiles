if vim.g.vscode then
    vim.cmd [[ set noloadplugins ]]
    return
end

-- Byte-compile and cache Lua modules (replaces impatient.nvim)
vim.loader.enable()

-- General
require "utils"
require "settings"
require "plugins"
require "mappings"
require "commands"
require "theme"
require "lsp"
-- require "neovide"

-- Plugins
require "plugins.blink"
require "plugins.nvim-autopairs"
require "plugins.treesitter"
require "plugins.nvim-web-devicons"
require "plugins.lualine"
require "plugins.indent-blankline"
require "plugins.nvim-tree"
require "plugins.oil"
require "plugins.gitsigns"
require "plugins.colorizer"
require "plugins.trouble"
require "plugins.fzf"
require "plugins.nvim-dap"
require "plugins.crates"
require "plugins.nvim-ufo"
require "plugins.render-markdown"
require "plugins.which-key"
