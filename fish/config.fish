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
        # TokyoNight Color Palette
        set -l foreground 3760bf
        set -l selection 99a7df
        set -l comment 848cb5
        set -l red f52a65
        set -l orange b15c00
        set -l yellow 8c6c3e
        set -l green 587539
        set -l purple 7847bd
        set -l cyan 007197
        set -l pink 9854f1

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
        # TokyoNight Color Palette
        set -l foreground c0caf5
        set -l selection 33467c
        set -l comment 565f89
        set -l red f7768e
        set -l orange ff9e64
        set -l yellow e0af68
        set -l green 9ece6a
        set -l purple 9d7cd8
        set -l cyan 7dcfff
        set -l pink bb9af7
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
