# Run fish_setup to set universal and other one time setup
# if this computer hasn't been prepared before
set -q fish_setup_done; or fish_setup

# Local Bin
set PATH "$HOME/bin" $PATH

# Homebrew
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH

# Rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
. (rbenv init -|psub)

# Node stuff
# set NODE_PATH /usr/local/lib/node_modules
# set PATH /usr/local/share/npm/bin $PATH

set AWS_CREDENTIAL_FILE "$HOME/.aws_credentials"

# Allow each machine to specify unique configuration
# information
if test -f ~/.computer
  . ~/.computer
end
