# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="adman65"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rbenv thor)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

function geotag () {
  exiftool -GPSLatitude=$1 -GPSLongitude=$2 -overwrite_original $3
}

export BUNDLER_EDITOR=mate

alias bi="bundle install"
alias be="bundle exec"
alias ber="bundle exec rake"
alias bers="bundle exec rake spec"
alias berdm="bundle exec rake db:migrate"
alias bedr="bundle exec rake db:reset"
alias berg="bundle exec rails g"

alias download="curl -OJ"

if [[ -a ~/.env_variables ]]; then
  source ~/.env_variables
fi
