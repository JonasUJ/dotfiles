local wezterm = require "wezterm"

local scheme_name = "tokyonight"
local scheme = wezterm.color.get_builtin_schemes()[scheme_name]

local C_ACTIVE_BG = scheme.brights[1];
local C_ACTIVE_FG = scheme.foreground;
local C_BG = scheme.background;
local C_HL_1 = scheme.ansi[5];
local C_HL_2 = scheme.ansi[4];
local C_INACTIVE_FG;
local bg = wezterm.color.parse(scheme.background);
local h, s, l, a = bg:hsla();
if l > 0.5 then
    C_INACTIVE_FG = bg:complement_ryb():darken(0.3);
else
    C_INACTIVE_FG = bg:complement_ryb():lighten(0.3);
end

scheme.tab_bar = {
    background = C_BG,
    new_tab = {
        bg_color = C_BG,
        fg_color = C_HL_1,
    },
    active_tab = {
        bg_color = C_ACTIVE_BG,
        fg_color = C_ACTIVE_FG,
    },
    inactive_tab = {
        bg_color = C_BG,
        fg_color = C_INACTIVE_FG,
        italic = true,
    },
    inactive_tab_hover = {
        bg_color = C_BG,
        fg_color = C_INACTIVE_FG,
    }
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    if tab.is_active then
        return {
            { Foreground = { Color = C_HL_1 } },
            { Text = " " .. tab.tab_index + 1 },
            { Foreground = { Color = C_ACTIVE_FG } },
            { Text = " " .. tab.active_pane.title .. " " },
        }
    end
    return {
        { Foreground = { Color = C_HL_1 } },
        { Text = " " .. tab.tab_index + 1 },
        { Foreground = { Color = C_INACTIVE_FG } },
        { Text = " " .. tab.active_pane.title .. " " },
    }
end
)

return {
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    initial_cols = 107,
    initial_rows = 40,
    color_schemes = {
        [scheme_name] = scheme,
    },
    color_scheme = scheme_name,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
    keys = {
        { key = 'l', mods = 'CTRL|ALT', action = wezterm.action.ShowLauncher },
    },
}
