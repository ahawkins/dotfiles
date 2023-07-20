set -x EVPATH ~/.config/env

if type -q ev
	ev gnupg -q
	ev aws -q
	ev timetrap -q
	ev asdf -q

	if test -d $EVPATH/comp
		ev comp -q
	end
end
