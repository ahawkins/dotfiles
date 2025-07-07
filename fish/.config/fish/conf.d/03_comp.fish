# see https://github.com/ahawkins/comp

if test -f ~/.config/comp/env.fish
  source ~/.config/comp/env.fish
end

for file in (path sort ~/.config/comp/env.d/*.fish)
	source $file
end

if test -d $EVPATH/comp
	ev comp -q
end
