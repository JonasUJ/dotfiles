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
require "plugins.nvim-cmp"
require "plugins.nvim-autopairs"
require "plugins.impatient"
require "plugins.mason"
require "plugins.treesitter"
require "plugins.Comment"
require "plugins.nvim-web-devicons"
require "plugins.lualine"
require "plugins.indent-blankline"
require "plugins.nvim-tree"
require "plugins.gitsigns"
require "plugins.colorizer"
require "plugins.trouble"
require "plugins.telescope"
require "plugins.dressing"
require "plugins.nvim-dap"
require "plugins.crates"
require "plugins.nvim-ufo"
