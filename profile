[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export PATH=./bin:${PATH//:\.\/bin:}

touch "$HOME/.env"

source "$HOME/.env"

function geotag () {
  exiftool -GPSLatitude=$1 -GPSLongitude=$2 -overwrite_original $3
}

alias bi="bundle install"
alias be="bundle exec"
alias bes="bundle exec rake spec"
