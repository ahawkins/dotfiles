export RBENV_ROOT=/usr/local/var/rbenv
# Initialize rbenv
eval "$(rbenv init -)"

# Add rbenv to path
export PATH=$(rbenv root)/shims:$(rbenv root)/bin:$PATH

export AWS_CREDENTIAL_FILE="$HOME/.aws_credentials"

export REDIS_URL="redis://localhost:6379"
