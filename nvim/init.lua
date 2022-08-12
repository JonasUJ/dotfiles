if vim.g.vscode then
    vim.cmd [[ set noloadplugins ]]
    return
end

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
require "plugins.pear-tree"
require "plugins.treesitter"
require "plugins.nvim-comment"
require "plugins.barbar"
require "plugins.nvim-web-devicons"
require "plugins.galaxyline"
require "plugins.indent-blankline"
require "plugins.nvim-tree"
require "plugins.gitsigns"
require "plugins.colorizer"
require "plugins.trouble"
require "plugins.telescope"
require "plugins.nvim-dap"
require "plugins.crates"
