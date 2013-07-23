export RBENV_ROOT=/usr/local/var/rbenv
# Initialize rbenv
eval "$(rbenv init -)"

# Add rbenv to path
export PATH=$(rbenv root)/shims:$(rbenv root)/bin:$PATH
