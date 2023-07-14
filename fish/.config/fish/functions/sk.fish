function sk --wraps skillshare-workstation
	switch "$argv[1]"
		case tt
			set --erase argv[1]
			set --export TIMETRAP_SHEET skillshare
			set --export ASDF_RUBY_VERSION 2.6.6

			asdf exec timetrap $argv
		case gh
			set --erase argv[1]
			curl -u "ahawkins:$SKILLSHARE_GITHUB_ACCESS_TOKEN" $argv
		case dd
			set --erase argv[1]
			curl -H "DD-API-KEY: $DD_API_KEY" -H "DD-APPLICATION-KEY: $DD_APP_KEY" $argv
		case cf
			set --erase argv[1]
			curl -H "Authorization: $CF_API_KEY" $argv
		case '*'
			command skillshare-workstation $argv
	end
end
