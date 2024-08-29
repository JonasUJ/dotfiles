require "gitsigns".setup {
    current_line_blame = true,
    signs = {
        add          = { text = "┃" },
        change       = { text = "┃" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "┃" },
        untracked    = { text = '┇' },
    },
    signs_staged = {
        add          = { text = "┃" },
        change       = { text = "┃" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "┃" },
        untracked    = { text = '┇' },
    },
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        local opts = { buffer = bufnr }

        -- Navigation
        Map('n', 'hn', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end, opts)

        Map('n', 'hN', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end, opts)

        -- Actions
        Map('n', '<leader>hs', gitsigns.stage_hunk, opts)
        Map('n', '<leader>hr', gitsigns.reset_hunk, opts)
        Map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts)
        Map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, opts)
        Map('n', '<leader>hS', gitsigns.stage_buffer, opts)
        Map('n', '<leader>hu', gitsigns.undo_stage_hunk, opts)
        Map('n', '<leader>hR', gitsigns.reset_buffer, opts)
        Map('n', '<leader>hp', gitsigns.preview_hunk, opts)
        Map('n', '<leader>hd', gitsigns.diffthis, opts)
        Map('n', '<leader>hD', function() gitsigns.diffthis('~') end, opts)
        Map('n', '<leader>td', gitsigns.toggle_deleted, opts)

        -- Text object
        Map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
    end
}
