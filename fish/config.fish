if not set -q HOMEBREW_PREFIX
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

starship init fish | source

set WINHOME /mnt/c/Users/jonas
set -x GPG_TTY (tty)
