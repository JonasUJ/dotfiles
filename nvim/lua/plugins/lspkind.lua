local M = {}

M.format = require "lspkind".cmp_format {
    mode = "symbol_text",
    maxwidth = 50,
    symbol_map = {
        Text = "  ",
        Method = "  ",
        Function = "  ",
        Constructor = "  ",
        Variable = "[]",
        Class = "  ",
        Interface = " 蘒",
        Module = "  ",
        Property = "  ",
        Unit = " 塞 ",
        Value = "  ",
        Enum = " 練",
        Keyword = "  ",
        Snippet = "  ",
        Color = "",
        File = "",
        Folder = " ﱮ ",
        EnumMember = "  ",
        Constant = "  ",
        Struct = "  "
    }
}

return M
