-- Command helper
function cmd(name, action)
    vim.api.nvim_add_user_command(name, function (tbl) vim.cmd(action .. ' ' .. tbl.args) end, { nargs = '*' })
end

cmd('CargoRun', '!cargo run')
cmd('CargoTest', '!cargo test')
cmd('CargoBench', '!cargo bench')
cmd('CargoBuild', '!cargo build')
cmd('CargoCheck', '!cargo check')
cmd('CargoClean', '!cargo clean')
cmd('CargoDoc', '!cargo doc')
cmd('CargoUpdate', '!cargo update')
