# Run fish_setup to set universal and other one time setup
# if this computer hasn't been prepared before
set -q fish_setup_done; or fish_setup

set -x EDITOR vim
set -x S_SRC_DIR ~/src

# Put my bin dir on path
if test -d "$S_SRC_DIR/ahawkins/bindir/bin"
  set PATH "$S_SRC_DIR/ahawkins/bindir/bin" $PATH
end

# Local Bin
if test -d "$HOME/bin"
  set PATH "$HOME/bin" $PATH
end

# Shutup direnv
set -x DIRENV_LOG_FORMAT ""

# Run hook for per-directory env variables
eval (direnv hook fish)

# Allow each machine to specify unique configuration
# information
if test -f ~/.computer
  . ~/.computer
end
