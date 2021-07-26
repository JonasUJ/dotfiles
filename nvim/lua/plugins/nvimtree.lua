vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window

vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'env' }

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    -- mappings
    { key = "<CR>", cb = tree_cb("edit")},
    { key = "o", cb = tree_cb("edit")},
    { key = "l", cb = tree_cb("edit")},
    { key = "<2-LeftMouse>", cb = tree_cb("edit")},
    { key = "<2-RightMouse>", cb = tree_cb("cd")},
    { key = "_", cb = tree_cb("cd")},
    { key = "-", cb = tree_cb("dir_up")},
    { key = "v", cb = tree_cb("vsplit")},
    { key = "s", cb = tree_cb("split")},
    { key = "t", cb = tree_cb("tabnew")},
    { key = "h", cb = tree_cb("close_node")},
    { key = "<BS>", cb = tree_cb("close_node")},
    { key = "I", cb = tree_cb("toggle_ignored")},
    { key = "H", cb = tree_cb("toggle_dotfiles")},
    { key = "R", cb = tree_cb("refresh")},
    { key = "a", cb = tree_cb("create")},
    { key = "d", cb = tree_cb("remove")},
    { key = "r", cb = tree_cb("rename")},
    { key = "<C-r>", cb = tree_cb("full_rename")},
    { key = "x", cb = tree_cb("cut")},
    { key = "c", cb = tree_cb("copy")},
    { key = "p", cb = tree_cb("paste")},
    { key = "q", cb = tree_cb("close")},
}
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}
