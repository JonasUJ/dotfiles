-- vim.__toggle = function ()
--     if require'nvim-tree.view'.win_open{any_tabpage=true} then
--         require'bufferline.state'.set_offset(0)
--         require'nvim-tree'.close()
--     else
--         require'bufferline.state'.set_offset(31, '')
--         require'nvim-tree'.find_file(true)
--     end
-- end
-- 
-- vim.api.nvim_set_keymap('n', '<Leader>t', '<CMD>lua vim.__toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
    auto_ignore_ft = { 'startify', 'dashboard' }, -- empty by default, don't auto open tree on specific filetypes.
    indent_markers = 1, -- 0 by default, this option shows indent markers when folders are open
    git_hl = 1, -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
    add_trailing = 1, -- 0 by default, append a trailing slash to folder names
    group_empty = 1, -- 0 by default, compact folders that only contain a single folder into one node in the file tree

    icons = {
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
    },

    -- disables netrw completely
    disable_netrw       = true,
    -- hijack netrw window on startup
    hijack_netrw        = true,
    -- open the tree when running this setup function
    open_on_setup       = false,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup  = {},
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab         = false,
    -- hijacks new directory buffers when they are opened.
    update_to_buf_dir   = {
        -- enable the feature
        enable = true,
        -- allow to open the tree if it was previously closed
        auto_open = true,
    },
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor       = true,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd          = false,
    -- show lsp diagnostics in the signcolumn
    diagnostics = {
        enable = true,
    },
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable      = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd  = false,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {}
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd  = nil,
        -- the command arguments as a list
        args = {}
    },

    view = {
        -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
        width = 30,
        -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
        height = 30,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = 'left',
        -- if true the tree will resize itself after opening a file
        auto_resize = false,
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = false,
            -- list of mappings to set on the tree manually
            list = {
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
        }
    }
}
