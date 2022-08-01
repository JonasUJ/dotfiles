require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'rust', 'python', 'lua', 'html', 'c_sharp', 'java' },
    highlight = {
        enable = true,
    }
}
