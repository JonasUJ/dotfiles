local gl = require('galaxyline')

vim.o.laststatus = 2

-- TODO: link to highlight groups
-- TokyoNight Storm
local colors = {
    bg = '#1f2335',
    secondary_bg = '#414868',
    red = '#f7768e',
    red1 = '#db4b4b',
    green = '#9ece6a',
    yellow = '#e0af68',
    blue = '#7aa2f7',
    purple = '#9d7cd8',
    cyan = '#7dcfff',
    grey = '#a9b1d6',
    orange = '#ff9e64',
    error_red = '#db4b4b',
    turquoise = '#73daca',
    teal = '#1abc9c',
    gitadd = '#449dab',
    gitdelete = '#914c54',
    gitchange = '#6183bb',
    gitconflict = '#bb7a61',
}

-- One Dark
-- local colors = {
--     bg = '#282C34',
--     red = '#E06C75',
--     green = '#98C379',
--     yellow = '#E5C07B',
--     blue = '#61AFEF',
--     purple = '#C678DD',
--     cyan = '#56B6C2',
--     grey = '#ABB2BF',
--     orange = '#FF8800',
--     error_red = '#F44747',
-- }

local mode_color = {
    n = {colors.blue, 'NORMAL'},
    no = {colors.green, 'OPERATOR PENDING'},
    i = {colors.turquoise, 'INSERT'},
    v = {colors.purple, 'VISUAL'},
    V = {colors.purple, 'VISUAL LINE'},
    [''] = {colors.purple, 'VISUAL BLOCK'},
    c = {colors.yellow, 'COMMAND'},
    ic = {colors.turquoise, 'INSERT'},
    cv = {colors.red, 'EX'},
    ce = {colors.red, 'EX'},
    s = {colors.orange, 'SELECT'},
    S = {colors.orange, 'SELECT LINE'},
    [''] = {colors.orange, 'SELECT BLOCK'},
    R = {colors.red, 'REPLACE'},
    Rv = {colors.red, 'VIRTUAL REPLACE'},
    r = {colors.cyan, 'HIT ENTER'},
    rm = {colors.cyan, 'MORE'},
    ['r?'] = {colors.cyan, 'CONFIRM'},
    ['!'] = {colors.blue, 'SHELL'},
    t = {colors.yellow, 'TERMINAL'}
}

local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'packer', 'trouble', 'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks', 'dapui_watches', 'dap-repl'}

local N = 1
function S()
    N = N + 1
    return N
end

gls.left[S()] = {
    ViSpace = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViSpace guibg=' .. mode_color[vim.fn.mode()][1])
            return ' '
        end,
        highlight = {colors.bg, 'NONE'}
    }
}

gls.left[S()] = {
    ViMode = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()][1])
            return mode_color[vim.fn.mode()][2]
        end,
        highlight = {colors.bg, 'NONE'}
    }
}

gls.left[S()] = {
    ViSpace = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViSpace guibg=' .. mode_color[vim.fn.mode()][1])
            return ' '
        end,
        highlight = {colors.bg, 'NONE'}
    }
}

gls.left[S()] = {
    ViSepLeftSpace = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViSepLeftSpace guifg=' .. mode_color[vim.fn.mode()][1])
            return '???'
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {'NONE', colors.secondary_bg}
    }
}

gls.left[S()] = {
    GitIcon = {
        provider = function()
            return '???'
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {colors.blue, colors.secondary_bg}
    }
}

gls.left[S()] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {colors.blue, colors.secondary_bg}
    }
}

gls.left[S()] = {
    SepLeftSpace = {
        provider = function()
            return '???'
        end,
        condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.secondary_bg, colors.bg}
    }
}

gls.left[S()] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '??? ',
        highlight = {colors.gitadd, colors.bg}
    }
}

gls.left[S()] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = '??? ',
        highlight = {colors.gitchange, colors.bg}
    }
}

gls.left[S()] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '??? ',
        highlight = {colors.gitdelete, colors.bg}
    }
}

gls.left[S()] = {
    SepLeftSlimSpace = {
        provider = function()
            return '???'
        end,
        condition = function()
            return condition.hide_in_width() and condition.check_git_workspace()
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.secondary_bg, colors.bg}
    }
}

gls.left[S()] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {colors.turquoise, colors.bg}
    }
}

gls.left[S()] = {
    FileName = {
        provider = 'FileName',
        condition.buffer_not_empty,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.turquoise, colors.bg}
    }
}

N = 1

local function Clock ()
    return os.date("%H:%M")
end

gls.mid[S()] = {
    Clock = {
        provider = Clock,
        icon = "??? ",
        condition = condition.hide_in_width,
        highlight = {colors.secondary_bg, colors.bg}
    }
}

N = 1

gls.right[S()] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = ' ??? ',
        condition = condition.hide_in_width,
        highlight = {colors.red1, colors.bg}
    }
}

gls.right[S()] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = ' ??? ',
        condition = condition.hide_in_width,
        highlight = {colors.yellow, colors.bg}
    }
}

gls.right[S()] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = ' ??? ',
        condition = condition.hide_in_width,
        highlight = {colors.teal, colors.bg}
    }
}

gls.right[S()] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = ' ??? ',
        condition = condition.hide_in_width,
        highlight = {colors.cyan, colors.bg}
    }
}

gls.right[S()] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        icon = '??? ',
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[S()] = {
    SepRightSpace = {
        provider = function()
            return '???'
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.secondary_bg, colors.bg}
    }
}

gls.right[S()] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {colors.grey, colors.secondary_bg}
    }
}

gls.right[S()] = {
    Percent = {
        provider = 'LinePercent',
        highlight = {colors.grey, colors.secondary_bg}
    }
}

gls.right[S()] = {
    SepRightSlimSpace = {
        provider = function()
            return '???'
        end,
        condition = condition.hide_in_width,
        highlight = {colors.bg, colors.secondary_bg}
    }
}

gls.right[S()] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {colors.grey, colors.secondary_bg}
    }
}

gls.right[S()] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {colors.grey, colors.secondary_bg}
    }
}

gls.right[S()] = {
    ViSepRightSpace = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViSepRightSpace guifg=' .. mode_color[vim.fn.mode()][1])
            vim.api.nvim_command('hi GalaxyRFileIcon guibg=' .. mode_color[vim.fn.mode()][1])
            vim.api.nvim_command('hi GalaxyBufferType guibg=' .. mode_color[vim.fn.mode()][1])
            return '???'
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {'NONE', colors.secondary_bg}
    }
}

gls.right[S()] = {
    ViSpace = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViSpace guibg=' .. mode_color[vim.fn.mode()][1])
            return ' '
        end,
        highlight = {colors.bg, 'NONE'}
    }
}

gls.right[S()] = {
    RFileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {colors.bg, 'NONE'}
    }
}

gls.right[S()] = {
    BufferType = {
        provider = 'FileTypeName',
        separator_highlight = {'NONE', colors.secondary_bg},
        highlight = {colors.bg, 'NONE'}
    }
}

gls.right[S()] = {
    ViSpace = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViSpace guibg=' .. mode_color[vim.fn.mode()][1])
            return ' '
        end,
        highlight = {colors.bg, 'NONE'}
    }
}

N = 1

gls.short_line_left[S()] = {
    ShortSepLeftSpace = {
        provider = function()
            return ' '
        end,
        highlight = {'NONE', colors.secondary_bg}
    }
}

gls.short_line_left[S()] = {
    SFileIcon = {
        provider = 'FileIcon',
        highlight = {colors.blue, colors.secondary_bg}
    }
}

gls.short_line_left[S()] = {
    SFileName = {
        provider = 'FileName',
        highlight = {colors.blue, colors.secondary_bg}
    }
}

gls.short_line_left[S()] = {
    SSepLeftSpace = {
        provider = function()
            return '???'
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.secondary_bg, colors.bg}
    }
}
