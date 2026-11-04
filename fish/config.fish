if not set -q HOMEBREW_PREFIX
    if type -q brew
        eval (brew shellenv)
    else
	if type -q /home/linuxbrew/.linuxbrew/bin/brew
	    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        else
            eval (/opt/homebrew/bin/brew shellenv)
        end
    end
end

starship init fish | source

set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library/
set WINHOME /mnt/c/Users/jonas
set -x GPG_TTY (tty)

function theme -a name
    if [ $name = "light" ]
        # Catppuccin Latte Color Palette
        set -l foreground 4c4f69
        set -l selection ccd0da
        set -l comment 8c8fa1
        set -l red d20f39
        set -l orange fe640b
        set -l yellow df8e1d
        set -l green 40a02b
        set -l purple 8839ef
        set -l cyan 04a5e5
        set -l pink ea76cb

        # Syntax Highlighting Colors
        set -g fish_color_normal $foreground
        set -g fish_color_command $cyan
        set -g fish_color_keyword $pink
        set -g fish_color_quote $yellow
        set -g fish_color_redirection $foreground
        set -g fish_color_end $orange
        set -g fish_color_error $red
        set -g fish_color_param $purple
        set -g fish_color_comment $comment
        set -g fish_color_selection --background=$selection
        set -g fish_color_search_match --background=$selection
        set -g fish_color_operator $green
        set -g fish_color_escape $pink
        set -g fish_color_autosuggestion $comment

        # Completion Pager Colors
        set -g fish_pager_color_progress $comment
        set -g fish_pager_color_prefix $cyan
        set -g fish_pager_color_completion $foreground
        set -g fish_pager_color_description $comment
        set -g fish_pager_color_selected_background --background=$selection
    else if [ $name = "dark" ]
        # Catppuccin Mocha Color Palette
        set -l foreground cdd6f4
        set -l selection 313244
        set -l comment 7f849c
        set -l red f38ba8
        set -l orange fab387
        set -l yellow f9e2af
        set -l green a6e3a1
        set -l purple cba6f7
        set -l cyan 89dceb
        set -l pink f5c2e7
        # Syntax Highlighting Colors

        set -g fish_color_normal $foreground
        set -g fish_color_command $cyan
        set -g fish_color_keyword $pink
        set -g fish_color_quote $yellow
        set -g fish_color_redirection $foreground
        set -g fish_color_end $orange
        set -g fish_color_error $red
        set -g fish_color_param $purple
        set -g fish_color_comment $comment
        set -g fish_color_selection --background=$selection
        set -g fish_color_search_match --background=$selection
        set -g fish_color_operator $green
        set -g fish_color_escape $pink
        set -g fish_color_autosuggestion $comment

        # Completion Pager Colors
        set -g fish_pager_color_progress $comment
        set -g fish_pager_color_prefix $cyan
        set -g fish_pager_color_completion $foreground
        set -g fish_pager_color_description $comment
        set -g fish_pager_color_selected_background --background=$selection
    end
end

theme dark

# Switch palettes to match the terminal's light/dark colours (fish detects them itself)
function __theme_follow_terminal --on-variable fish_terminal_color_theme
    if contains -- $fish_terminal_color_theme light dark
        theme $fish_terminal_color_theme
    end
end

# Follow WezTerm's Ctrl+Alt+O toggle in already-open shells: the toggle writes
# light/dark to this file, and each prompt applies it if it changed since last seen
set -g __theme_file ~/.cache/wezterm-theme
function __theme_file_stamp
    test -r $__theme_file; or return 1
    read -l t <$__theme_file
    echo (path mtime $__theme_file) $t
end
set -g __theme_file_seen (__theme_file_stamp)
function __theme_sync --on-event fish_prompt
    set -l stamp (__theme_file_stamp); or return
    test "$stamp" = "$__theme_file_seen"; and return
    set -g __theme_file_seen $stamp
    set -l t (string split ' ' -- $stamp)[2]
    contains -- $t light dark; and theme $t
end
