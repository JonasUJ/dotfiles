-- oil.nvim: a directory is a normal buffer. Rename/create/delete/move files by editing
-- the lines (a trailing "/" makes a directory), then :w to apply. g? shows all keys.
require "oil".setup {
    -- Opening a directory (`nvim .`, :e src/) is left to nvim-tree
    default_file_explorer = false,
    -- Deleted files go to the trash (toggle viewing it with g\) instead of being removed
    delete_to_trash = true,
    -- Refresh automatically when files change on disk
    watch_for_changes = true,
    view_options = {
        show_hidden = true, -- dotfiles visible, like before; g. toggles
    },
    keymaps = {
        -- Keep <C-h>/<C-l> for window navigation (see mappings.lua)
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        -- Open in split: <C-s> vertical (oil default), <C-x> horizontal, <C-t> tab
        ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
    },
}

-- -: open the current file's folder in oil (the tree itself is on <Leader>t, see nvim-tree.lua)
Map("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory in oil" })
