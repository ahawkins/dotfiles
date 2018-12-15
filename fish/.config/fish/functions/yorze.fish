function yorze
	switch "$argv[1]"
		case report
			set --erase argv[1]
			argparse 'm/month=' -- $argv

			set start_month $_flag_month
			set end_month (math "$_flag_month+1")

			pushd $S_SRC_DIR/yorzegroup/mono
			git log \
				--since "2018-$start_month-01" \
				--until "2018-$end_month-01" \
				--pretty=format:'%ad - %h - %s' \
				--date short
			popd
		case dev
			set --erase argv[1]

			pushd $S_SRC_DIR/yorzegroup/mono
			script/deploy-dev $argv
			popd
		case '*'
			echo "Unknown command"
			return 1
	end
end
