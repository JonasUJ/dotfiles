local wezterm = require "wezterm"

local dark_scheme_name = "Catppuccin Mocha"
local light_scheme_name = "Catppuccin Latte"
local color_schemes = {}

for _, scheme_name in pairs({ dark_scheme_name, light_scheme_name }) do
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

    color_schemes[scheme_name] = scheme
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local tab_bar = config.color_schemes[config.color_scheme].tab_bar
    if tab.is_active then
        return {
            { Foreground = { Color = tab_bar.new_tab.fg_color } },
            { Text = " " .. tab.tab_index + 1 },
            { Foreground = { Color = tab_bar.active_tab.fg_color } },
            { Text = " " .. tab.active_pane.title .. " " },
        }
    end
    return {
        { Foreground = { Color = tab_bar.new_tab.fg_color } },
        { Text = " " .. tab.tab_index + 1 },
        { Foreground = { Color = tab_bar.inactive_tab.fg_color } },
        { Text = " " .. tab.active_pane.title .. " " },
    }
end
)

-- Shells read this file at each prompt to follow the toggle (see fish/config.fish)
local theme_file
if wezterm.target_triple:find("windows") then
    theme_file = "//wsl.localhost/Ubuntu/home/jonasuj/.cache/wezterm-theme"
else
    theme_file = wezterm.home_dir .. "/.cache/wezterm-theme"
end

wezterm.on("switch-scheme", function(window, pane)
    local overrides = window:get_config_overrides() or {}
    -- No override yet means the configured default scheme is showing
    local current = overrides.color_scheme or window:effective_config().color_scheme
    local theme
    if current == dark_scheme_name then
        overrides.color_scheme = light_scheme_name
        theme = "light"
    else
        overrides.color_scheme = dark_scheme_name
        theme = "dark"
    end

    window:set_config_overrides(overrides)

    local f = io.open(theme_file, "w")
    if f then
        f:write(theme)
        f:close()
    else
        wezterm.log_warn("could not write " .. theme_file)
    end
end)

return {
    font = wezterm.font("Cascadia Code NF"),
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    initial_cols = 107,
    initial_rows = 40,
    color_schemes = color_schemes,
    color_scheme = dark_scheme_name,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
    keys = {
        { key = 'o', mods = 'CTRL|ALT', action = wezterm.action.EmitEvent "switch-scheme" },
        { key = 'l', mods = 'CTRL|ALT', action = wezterm.action.ShowLauncher },
    },
}
