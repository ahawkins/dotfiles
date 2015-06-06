function vha
	vagrant global-status | grep running | awk '{print $1}' | xargs -L1 vagrant halt
end
