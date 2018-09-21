if ps aux | grep -qE '^_tokend.+Yubikey'
	security find-generic-password -s comp.yubikey.sudo_password -w -a $USER \
		| sudo -S kill (ps aux | grep -E '^_tokend.+Yubikey' | awk '{print $2}') ^ /dev/null
end
