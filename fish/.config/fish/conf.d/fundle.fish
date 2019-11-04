if type -q fundle
	fundle plugin joehillen/ev-fish
	fundle init
end

if type -q ev
	ev gnupg -q
	ev aws -q
	ev timetrap -q

	if test -d $EVPATH/comp
		ev comp -q
	end
end
