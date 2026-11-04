-- nvim-treesitter `main` branch: it only installs parsers and queries; highlighting
-- itself is built into Neovim and started per buffer below.
-- Building parsers needs the `tree-sitter` CLI (brew install tree-sitter-cli).
local parsers = {
    "rust", "python", "lua", "html", "c_sharp", "java", "go", "fsharp",
    "toml", "json", "yaml", "bash", "fish", "markdown", "markdown_inline",
    "vim", "vimdoc", "query",
}

require "nvim-treesitter".install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
    callback = function(ev)
        -- Only if a parser exists for this filetype; otherwise keep regular syntax
        pcall(vim.treesitter.start, ev.buf)
    end,
})
