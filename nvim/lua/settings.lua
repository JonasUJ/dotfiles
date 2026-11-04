require "utils"

G.mapleader = " "

O.conceallevel = 0          -- So that I can see `` in markdown files
O.fileencoding = "utf-8"    -- The encoding written to file
O.wrap = false              -- Display long lines as just one line
O.mouse = "a"               -- Enable your mouse
O.splitbelow = true         -- Horizontal splits will automatically be below
O.splitright = true         -- Vertical splits will automatically be to the right
O.tabstop = 4               -- Insert 4 spaces for a tab
O.shiftwidth = 4            -- Change the number of space characters inserted for indentation
O.expandtab = true          -- Converts tabs to spaces
O.number = true             -- Line numbers
O.cursorline = true         -- Enable highlighting of the current line
O.showtabline = 2           -- Always show tabs
O.updatetime = 300          -- Faster completion
O.timeoutlen = 500          -- By default timeoutlen is 1000 ms
O.clipboard = "unnamedplus" -- Copy paste between vim and everything else
O.path = ".,,**"            -- Easier find
O.showmode = false          -- Mode is shown on statusline instead
O.scrolloff = 4             -- Scroll offset
O.swapfile = false          -- Swapfiles are annoying when autosaving
O.colorcolumn = "101"
O.signcolumn = "yes"

vim.opt.shortmess:append "I" -- disable intro message

O.grepprg = "rg --vimgrep --no-heading --smart-case --"
O.grepformat = "%f:%l:%c:%m,%f%l%m"

O.undodir = vim.env.HOME .. "/.nvim/undodir"
O.undofile = true

G.filetype_fs = "fsharp"

-- Enable filetype detection now (Nvim would only do it after init.lua), so the
-- fallback below runs after detection instead of before it
vim.cmd "filetype plugin indent on"

-- Files without a detected filetype are treated as text
vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("default_filetype", { clear = true }),
    callback = function(ev)
        if vim.bo[ev.buf].filetype == "" then vim.bo[ev.buf].filetype = "text" end
    end,
})

-- Autosave on leaving insert mode or changing text in normal mode
-- (filetypes listed in g:autosave_ft_ignore are skipped)
G.autosave_ft_ignore = {}
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("autosave", { clear = true }),
    nested = true, -- so BufWritePost hooks (tags, gitsigns, ...) still run
    callback = function(ev)
        local bo = vim.bo[ev.buf]
        if bo.readonly or not bo.modifiable or bo.buftype ~= "" or vim.api.nvim_buf_get_name(ev.buf) == ""
            or vim.tbl_contains(G.autosave_ft_ignore, bo.filetype) then
            return
        end
        vim.cmd "silent write!"
    end,
})

-- On WSL, use win32yank when it is installed (Neovim picks it up by itself);
-- otherwise fall back to clip.exe / PowerShell
if vim.fn.has("wsl") == 1 and vim.fn.executable("win32yank.exe") == 0 then
    local paste = "powershell.exe -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))"
    G.clipboard = {
        name = "WslClipboard",
        copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
        paste = { ["+"] = paste, ["*"] = paste },
        cache_enabled = 0,
    }
end
