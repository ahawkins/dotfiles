# Run fish_setup to set universal and other one time setup
# if this computer hasn't been prepared before
set -q fish_setup_done; or fish_setup

# Allow each machine to specify unique configuration
# information
if test -f ~/.computer
  . ~/.computer
end

# Local Bin
set PATH "$HOME/bin" $PATH

# Put my bin dir on path
set PATH "$HOME/bindir/bin" $PATH

# Shutup direnv
set -x DIRENV_LOG_FORMAT ""

# Run hook for per-directory env variables
eval (direnv hook fish)
