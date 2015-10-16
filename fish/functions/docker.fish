function docker
	switch $argv[1]
		case wipe
			command docker stop (docker ps -a -q)
			command docker rm -v (docker ps -a -q)
		case reload
			if command docker-machine active > /dev/null ^&1
				command docker-machine restart (docker-machine active)
				command docker-machine env (docker-machine active) | source
			elsif test -n $DEFAULT_DOCKER_MACHINE
				command docker-machine start $DEFAULT_DOCKER_MACHINE
				command docker-machine env $DEFAULT_DOCKER_MACHINE | source
			else
				echo "No active docker-machine!" ^&1
				return 1
			end
		case use
			if test -n $argv[2]
				set -e DEFAULT_DOCKER_MACHINE
				set -xU DEFAULT_DOCKER_MACHINE $argv[2]

				command docker-machine start $argv[2]
				command docker-machine env $argv[2] | source
			else
				echo "USAGE: docker use DOCKER_MACHINE" ^&1
				return 1
			end
		case clean
			command docker images --no-trunc | grep none | awk '{print $3}' | xargs docker rmi
		case nuke
			docker clean
			docker wipe
		case '*'
			command docker $argv
	end
end
