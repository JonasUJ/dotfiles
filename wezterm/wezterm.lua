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

local PROGRESS_GLYPHS = {
    { 5, "\u{f0130}" }, { 18, "\u{f0a9e}" }, { 31, "\u{f0a9f}" }, { 43, "\u{f0aa0}" },
    { 56, "\u{f0aa1}" }, { 68, "\u{f0aa2}" }, { 81, "\u{f0aa3}" }, { 94, "\u{f0aa4}" },
}
local PROGRESS_FULL_GLYPH = "\u{f0aa5}"
local PROGRESS_INDETERMINATE_GLYPH = "\u{f051f}"

local function progress_glyph(pct)
    for _, step in ipairs(PROGRESS_GLYPHS) do
        if pct <= step[1] then
            return step[2]
        end
    end
    return PROGRESS_FULL_GLYPH
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local scheme = config.color_schemes[config.color_scheme]
    local tab_bar = scheme.tab_bar
    local title_fg = tab.is_active and tab_bar.active_tab.fg_color or tab_bar.inactive_tab.fg_color

    local elements = {
        { Foreground = { Color = tab_bar.new_tab.fg_color } },
        { Text = " " .. tab.tab_index + 1 },
    }

    local progress = tab.active_pane.progress or "None"
    if progress ~= "None" then
        local color, glyph
        if progress == "Indeterminate" then
            color, glyph = scheme.ansi[3], PROGRESS_INDETERMINATE_GLYPH
        elseif progress.Error then
            color, glyph = scheme.ansi[2], progress_glyph(progress.Error)
        else
            color, glyph = scheme.ansi[3], progress_glyph(progress.Percentage or 0)
        end
        table.insert(elements, { Foreground = { Color = color } })
        table.insert(elements, { Text = " " .. glyph })
    end

    table.insert(elements, { Foreground = { Color = title_fg } })
    table.insert(elements, { Text = " " .. tab.active_pane.title .. " " })
    return elements
end)

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
    font = wezterm.font_with_fallback({ "Nordwand Mono", "Cascadia Code NF" }),
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    initial_cols = 107,
    initial_rows = 40,
    color_schemes = color_schemes,
    color_scheme = dark_scheme_name,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
    window_decorations = wezterm.target_triple:find("darwin")
        and "MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR|TITLE|RESIZE"
        or nil,
    keys = {
        { key = 'o', mods = 'CTRL|ALT', action = wezterm.action.EmitEvent "switch-scheme" },
        { key = 'l', mods = 'CTRL|ALT', action = wezterm.action.ShowLauncher },
    },
}
