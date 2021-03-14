# Source host specific configuration
if test -f ~/.config/comp/env.fish
  source ~/.config/comp/env.fish
end

if test -d $EVPATH/comp
	ev comp -q
end
