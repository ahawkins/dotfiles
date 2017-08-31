if type -q fundle
	fundle plugin ahawkins/ev-fish --url 'https://github.com/ahawkins/ev-fish.git#bugfix/replace-ls'
	fundle init
end

if type -q ev
	ev gnupg > /dev/null
	ev comp > /dev/null
end
