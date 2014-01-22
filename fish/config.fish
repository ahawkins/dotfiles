set -g fish_greeting ''

set EDITOR /usr/local/bin/vim
set BUNDLE_EDITOR mate

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

. ~/.config/fish/abbrevations.fish

# Allow each machine to specify unique configuration
# information
if test -f ~/.computer
  . ~/.computer
end
