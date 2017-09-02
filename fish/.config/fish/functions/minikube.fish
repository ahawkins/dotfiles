function minikube -w minikube
	switch "$argv[1]"
		case stop
			if command minikube status | grep -F 'minikube' | cut -d ' ' -f 2 | grep -qi 'running'
				command minikube stop
			end
		case start
			if command minikube status | grep -F 'minikube' | cut -d ' ' -f 2 | grep -qi 'stopped';
				command minikube start
			end
		case docker
			eval (command minikube docker-env)
			command docker $argv[2..-1]
		case nuke
			if set --query argv[2]
				for kind in deployments pods services configmaps hpa volumes daemonsets jobs persistentvolumes
					kubectl --context minikube delete $kind --all --namespace $argv[2]
				end
			else
				echo 'Usage: minkube nuke NAMESPACE' ^&1
				return 1
			end
		case '*'
			command minikube $argv
	end
end
