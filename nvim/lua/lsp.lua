vim.o.completeopt = "menuone,noselect"

-- require'compe'.setup {
--     enabled = true,
--     autocomplete = true,
--     debug = false,
--     min_length = 1,
--     preselect = 'enable',
--     throttle_time = 80,
--     source_timeout = 200,
--     incomplete_delay = 400,
--     max_abbr_width = 100,
--     max_kind_width = 100,
--     max_menu_width = 100,
--     documentation = true,
--
--     source = {
--         path = {kind = "  "},
--         buffer = {kind = "  "},
--         calc = {kind = "  "},
--         vsnip = {kind = "  "},
--         nvim_lsp = {kind = "  "},
--         nvim_lua = {kind = "  "},
--         spell = {kind = "  "},
--         tags = false,
--         emoji = {kind = " ﲃ ", filetypes={"markdown"}}
--     }
-- }

local cmp = require'cmp'
cmp.setup {
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item{ behavior = cmp.SelectBehavior.Insert },
        ['<S-Tab>'] = cmp.mapping.select_prev_item{ behavior = cmp.SelectBehavior.Insert },
        ['<C-y>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm{ select = true, behavior = cmp.SelectBehavior.Replace },
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer' },
        { name = 'path' },
        { name = 'crates' },
    },
}

cmp.setup.cmdline(':', {
        sources = cmp.config.sources(
            {
                { name = 'path' }
            },
            {
                { 
                    name = 'cmdline',
                    -- Re-fix https://github.com/hrsh7th/cmp-cmdline/issues/5
                    keyword_pattern = [=[[[:keyword:]-]*]=]
                }
            })
    })

cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
--     setup_servers() -- reload installed servers
--     vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-- symbols for autocomplete
require('lspkind').init({
        with_text = false,
        symbol_map = {
            Text = '  ',
            Method = '  ',
            Function = '  ',
            Constructor = '  ',
            Variable = '[]',
            Class = '  ',
            Interface = ' 蘒',
            Module = '  ',
            Property = '  ',
            Unit = ' 塞 ',
            Value = '  ',
            Enum = ' 練',
            Keyword = '  ',
            Snippet = '  ',
            Color = '',
            File = '',
            Folder = ' ﱮ ',
            EnumMember = '  ',
            Constant = '  ',
            Struct = '  '
        },
    })

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<A-f>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    vim.lsp.handlers['textDocument/publishDiagnostic'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                spacing = 4,
            },
            underline = true,
            update_in_insert = false,
            show_signs = true,
            severity_sort = true,
        })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    require "lsp_signature".on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            hint_prefix = "param ",
            hint_enable = false,
            handler_opts = {
                border = "none"
            }
        }, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)

local function setup_servers()
    require'nvim-lsp-installer'.on_server_ready(function(server)
        server:setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end)
end

setup_servers()
