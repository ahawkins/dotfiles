autoload -U colors && colors
# $name @ $host in $dir
PS1="%{%B%}%{%F{magenta}%}%n%{%f%}%{%b%} at %{%F{yellow}%}%m%{%f%} in %{%B%}%{%F{green}%}%c%{%f%}%{%b%} "

export BUNDLER_EDITOR=mate

alias bi="bundle install"
alias be="bundle exec"
alias ber="bundle exec rake"
alias bers="bundle exec rake spec"
alias berdm="bundle exec rake db:migrate"
alias bedr="bundle exec rake db:reset"
alias berg="bundle exec rails g"
alias berc="bundle exec rails c"
alias berup="bundle exec rackup"

alias download="curl -OJ"

if [[ -a ~/.env_variables ]]; then
  source ~/.env_variables
fi

# Make Rails Faster
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

PATH=$PATH:$HOME/dotfiles/scripts
PATH=$PATH:/usr/local/share/npm/bin # NPM -g

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Custom scripts!
geotag() {
  exiftool -GPSLatitude="$2" -GPSLongitude="$3" -overwrite_original "$1"
}

gifify() {
  if [[ -n "$1" ]]; then
    ffmpeg -i $1 -r 20 -vcodec png out-static-%05d.png
    time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
    rm out-static*.png
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

eval "$(hub alias -s)"
