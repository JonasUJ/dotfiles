local cmp = require "cmp"

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<S-Tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-y>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-e>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm { select = true, behavior = cmp.SelectBehavior.Replace },
    },
    sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
    },
    formatting = {
        format = require "plugins.lspkind".format;
    }
}

cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources(
        {
            { name = "cmp_git" },
        },
        {
            { name = "buffer" },
        }
    )
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources(
        {
            { name = "path" }
        },
        {
            {
                name = "cmdline",
                -- Re-fix https://github.com/hrsh7th/cmp-cmdline/issues/5
                keyword_pattern = [=[[[:keyword:]-]*]=]
            }
        }
    )
})

cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    }
})
