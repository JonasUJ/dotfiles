local dap, dapui = require('dap'), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◐", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped",
    { text = "→", texthl = "DiagnosticVirtualTextWarn", linehl = "DiagnosticVirtualTextWarn", numhl = "" })

dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = { "<CR>", "<2-LeftMouse>" },
        remove = { "d", "x" },
        edit = { "e", "a", "i" },
        repl = "r",
    },
    layouts = {
        {
            -- You can change the order of elements in the sidebar
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                {
                    id = "scopes",
                    size = 0.25, -- Can be float or integer > 1
                },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 00.25 },
            },
            size = 40,
            position = "left", -- Can be "left", "right", "top", "bottom"
        },
        {
            elements = { "repl" },
            size = 10,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
}

Map("n", "<Leader>k", "<Cmd>lua require'dapui'.eval()<CR>")
Map("n", "<Leader><F2>", "<Cmd>lua require'dapui'.toggle()<CR>")
Map("n", "<F3>", "<Cmd>lua require'dap'.restart()<CR>")
Map("n", "<Leader><F3>", "<Cmd>lua require'dap'.run_last()<CR>")
Map("n", "<F4>", "<Cmd>lua require'dap'.pause()<CR>")
Map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
Map("n", "<Leader><F5>", "<Cmd>lua require'dap'.reverse_continue()<CR>")
Map("n", "<F6>", "<Cmd>lua require'dap'.run_to_cursor()<CR>")
Map("n", "<Leader><F6>", "<Cmd>lua require'dap'.goto_()<CR>")
Map("n", "<F7>", "<Cmd>lua require'dap'.terminate()<CR>")
Map("n", "<Leader><F8>", "<Cmd>lua require'dap'.list_breakpoints()<CR><Cmd>Trouble quickfix<CR>")
Map("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
Map("n", "<Leader><F9>", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
Map("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
Map("n", "<Leader><F10>", "<Cmd>lua require'dap'.step_back()<CR>")
Map("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
Map("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
