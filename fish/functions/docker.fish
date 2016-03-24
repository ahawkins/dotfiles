function docker
	switch "$argv[1]"
		case reboot
			if test -n $ACTIVE_DOCKER_MACHINE
				command docker-machine start $ACTIVE_DOCKER_MACHINE
				command docker-machine env $ACTIVE_DOCKER_MACHINE | source
			else
				echo "No ACTIVE_DOCKER_MACHINE" ^&1
				return 1
			end
		case use
			if set -q argv[2]
				set -e ACTIVE_DOCKER_MACHINE
				set -xU ACTIVE_DOCKER_MACHINE $argv[2]

				command docker-machine start $argv[2]
				command docker-machine env $argv[2] | source
			else
				echo "USAGE: docker use DOCKER_MACHINE" ^&1
				return 1
			end
		case clean
			command docker stop (docker ps -aq)
			command docker rm -v (docker ps -aq)
			command docker images --no-trunc | grep -F '<none>' | awk '{print $3}' | xargs -L1 docker rmi -f
		case shutdown
			if test -n $ACTIVE_DOCKER_MACHINE
				docker-machine stop $ACTIVE_DOCKER_MACHINE
			else
				echo "No ACTIVE_DOCKER_MACHINE" ^&1
				return 1
			end
		case ip
			if test -n $ACTIVE_DOCKER_MACHINE
				docker-machine ip $ACTIVE_DOCKER_MACHINE
			else
				echo "No ACTIVE_DOCKER_MACHINE" ^&1
				return 1
			end
		case '*'
			command docker $argv
	end
end
