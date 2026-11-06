-- which-key: after a prefix such as <Leader>, g or z, shows the keys you can press next.
-- A key that is both a mapping and a prefix (e.g. <Leader>b) still runs after 'timeoutlen'.
local wk = require "which-key"

wk.setup {}

wk.add {
    { "<Leader>b", group = "buffers" },
    { "<Leader>c", group = "code" },
    { "<Leader>f", group = "find" },
    { "<Leader>g", group = "git" },
    { "<Leader>h", group = "hunks" },
}
