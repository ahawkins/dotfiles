if type -q fundle
	fundle plugin joehillen/ev-fish
	fundle init
end

if type -q ev
	ev gnupg > /dev/null
	ev aws > /dev/null

	if test -d $EVPATH/comp
		ev comp > /dev/null
	end
end
