require "lualine".setup {
    options = {
        globalstatus = false,
        disabled_filetypes = { "NvimTree", "packer", "Trouble", "dapui_scopes", "dapui_breakpoints", "dapui_stacks",
            "dapui_watches", "dap-repl", "fugitiveblame" }
    },
    tabline = {
        lualine_b = { "buffers" },
        lualine_y = { "tabs" },
        lualine_z = {
            {
                function()
                    return os.date("%H:%M:%S")
                end,
                icon = { "" },
            },
        }
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "branch",
                icon = { "", },
            },
        },
        lualine_c = {
            {
                "diff",
                symbols = { added = " ", modified = " ", removed = " " },
            },
            "filename",
        },
        lualine_x = {
            {
                "diagnostics",
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
            {
                function()
                    local clients = vim.lsp.buf_get_clients()
                    local name = "[No LSP]"
                    local count = 0

                    for _, v in pairs(clients) do
                        name = name .. ", " .. v.name
                        count = count + 1
                    end

                    if count > 0 then
                        name = name:sub(11)
                    end

                    return name
                end,
            },
        },
        lualine_y = {
            {
                "encoding",
                cond = function()
                    return O.encoding ~= "utf-8"
                end
            },
            {
                "'Spaces: ' .. O.shiftwidth",
                cond = function()
                    return O.shiftwidth ~= 4
                end,
            },
        },
        lualine_z = {
            {
                "filetype",
                colored = false,
                icon = { align = "right", },
            }
        },
    },
    -- winbar = {
    --     lualine_c = { "filename" },
    -- }
}

local opts = { silent = true }

local buffers = require "lualine.components.buffers"

local function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

local function rotate(amount)
    return function()
        local i = indexOf(buffers.bufpos2nr, vim.fn.bufnr())

        if i == nil then
            return
        end

        local new = math.fmod(i + amount - 1, #buffers.bufpos2nr)
        if new < 0 then
            new = #buffers.bufpos2nr - new - 1
        else
            new = new + 1
        end
        buffers.buffer_jump(new)
    end
end

-- Move to previous/next
Map("n", "<A-,>", rotate(-1), opts)
Map("n", "<A-.>", rotate(1), opts)

-- Close
Map("n", "<A-c>", function() vim.cmd [[bd!]] end, opts)

-- Goto buffer in position...
Map("n", "<A-1>", ":LualineBufferJump! 1<CR>", opts)
Map("n", "<A-2>", ":LualineBufferJump! 2<CR>", opts)
Map("n", "<A-3>", ":LualineBufferJump! 3<CR>", opts)
Map("n", "<A-4>", ":LualineBufferJump! 4<CR>", opts)
Map("n", "<A-5>", ":LualineBufferJump! 5<CR>", opts)
Map("n", "<A-6>", ":LualineBufferJump! 6<CR>", opts)
Map("n", "<A-7>", ":LualineBufferJump! 7<CR>", opts)
Map("n", "<A-8>", ":LualineBufferJump! 8<CR>", opts)
Map("n", "<A-9>", ":LualineBufferJump! 9<CR>", opts)
