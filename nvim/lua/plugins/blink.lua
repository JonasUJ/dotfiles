-- blink.cmp: completion (replaces nvim-cmp, its cmp-* sources, cmp_luasnip, lspkind and
-- LuaSnip; snippets use Neovim's built-in vim.snippet). It also adds the LSP completion
-- capabilities to every server by itself.
--
-- Keys kept from the old nvim-cmp setup: <Tab>/<S-Tab> select (inserting the item),
-- <CR> accepts only an item you selected, <C-Space> opens the menu,
-- <C-y>/<C-e> scroll the documentation window.
require "blink.cmp".setup {
    keymap = {
        preset = "none",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-y>"] = { "scroll_documentation_up", "fallback" },
        ["<C-e>"] = { "scroll_documentation_down", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
    },

    completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = {
            draw = {
                -- label, then icon + kind name (like lspkind's "symbol_text")
                columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
            },
        },
    },

    -- Function signature while typing arguments (replaces cmp-nvim-lsp-signature-help)
    signature = { enabled = true },

    appearance = {
        kind_icons = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
            -- issues/PRs/mentions in commit messages (replaces cmp-git)
            gitcommit = { "git", "buffer" },
        },
        providers = {
            git = { module = "blink-cmp-git", name = "Git" },
        },
    },

    -- : and / completion, shown while typing like the old cmp-cmdline setup
    cmdline = {
        keymap = { preset = "cmdline" },
        completion = { menu = { auto_show = true } },
    },
}
