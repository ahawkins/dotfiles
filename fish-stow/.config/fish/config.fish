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
set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

# Run hook for per-directory env variables
eval (direnv hook fish)
