function sk --wraps skillshare-workstation
	switch "$argv[1]"
		case tt
			set --erase argv[1]
			set --export TIMETRAP_SHEET skillshare

			timetrap $argv
		case gh
			set --erase argv[1]
			curl -u "ahawkins:$SKILLSHARE_GITHUB_ACCESS_TOKEN" $argv
		case '*'
			command skillshare-workstation $argv
	end
end
