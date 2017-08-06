# Run fish_setup to set universal and other one time setup
# if this computer hasn't been prepared before
set -q fish_setup_done; or fish_setup

# Source host specific configuration
if test -f ~/.config/comp/env.fish
  . ~/.config/comp/env.fish
end

set -x EDITOR vim

# Shutup direnv
set -x DIRENV_LOG_FORMAT ""

# GPG Configuration
set -x GPG_TTY (tty)

if test -f $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
	set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh
else if test -f ~/.gnupg/S.gpg-agent.ssh
	set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
end

# Run hook for per-directory env variables
if command -sq direnv; then
	eval (direnv hook fish)
end
