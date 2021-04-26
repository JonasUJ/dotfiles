local gl = require('galaxyline')

vim.o.laststatus = 2

local colors = {
    bg = '#282C34',
    red = '#E06C75',
    green = '#98C379',
    yellow = '#E5C07B',
    blue = '#61AFEF',
    purple = '#C678DD',
    cyan = '#56B6C2',
    grey = '#ABB2BF',
    orange = '#FF8800',
    error_red = '#F44747',
}

local mode_color = {
    n = {colors.green, 'NORMAL'},
    no = {colors.green, 'OPERATOR PENDING'},
    i = {colors.blue, 'INSERT'},
    v = {colors.purple, 'VISUAL'},
    V = {colors.purple, 'VISUAL LINE'},
    [''] = {colors.purple, 'VISUAL BLOCK'},
    c = {colors.cyan, 'COMMAND'},
    ic = {colors.cyan, 'INSERT'},
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
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()][1])
            return '' .. mode_color[vim.fn.mode()][2] .. ''
        end,
        highlight = {colors.bg, colors.bg}
    }
}

gls.left[2] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.bg, colors.bg}
    }
}

gls.left[3] = {
    GitIcon = {
        provider = function()
            return ''
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[4] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[5] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = ' ',
        highlight = {colors.green, colors.bg}
    }
}
gls.left[6] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' ',
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[7] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = ' ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[2] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.orange, colors.bg}
    }
}

gls.right[3] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.blue, colors.bg}
    }
}

gls.right[4] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.cyan, colors.bg}
    }
}

gls.right[5] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = ' ',
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[7] = {
    Percent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[8] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[9] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        separator = ' ',
        highlight = {colors.grey, colors.bg}
    }
}
gls.right[10] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[11] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[12] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.bg, colors.bg}
    }
}

gls.short_line_left[1] = {
    SFileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[1] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[2] = {
    Percent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[3] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        separator = ' ',
        highlight = {colors.grey, colors.bg}
    }
}
gls.short_line_right[5] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[6] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[7] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.bg, colors.bg}
    }
}
