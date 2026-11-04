require "crates".setup {
    -- In-process language server for Cargo.toml: version/feature completion (shows up
    -- through the nvim_lsp source in nvim-cmp), code actions on `<Leader>ca` and hover on `K`
    lsp = {
        enabled = true,
        completion = true,
        actions = true,
        hover = true,
    },
}
