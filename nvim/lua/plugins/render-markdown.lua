-- render-markdown: renders headings, lists, checkboxes, code blocks and tables inside
-- the buffer (replaces markdown-preview.nvim's browser preview). Raw text shows on the
-- cursor line and in insert mode; :RenderMarkdown toggle switches it off and on.
require "render-markdown".setup {
    latex = { enabled = false }, -- needs utftex/latex2text, not installed
}
