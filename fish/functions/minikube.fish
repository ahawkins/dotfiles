function minikube -w minikube
	switch "$argv[1]"
		case stop
			if command minikube status | grep -qi 'running'
				command minikube stop
			end
		case start
			if begin command minikube status | grep -qi 'stopped'; or command minikube status | grep -Fqi 'not exist'; end
				command minikube start
			end
		case docker
			eval (command minikube docker-env)
			command docker $argv[2..-1]
		case nuke
			for kind in deployments pods services
				kubectl --context minikube get namespaces -o name \
					| cut -d '/' -f 2 \
					| grep -vF 'kube-system' \
					| xargs -t -L1 -I '{}' kubectl --context minikube delete $kind --namespace '{}' --all
			end

			kubectl --context minikube get namespaces -o name \
					| cut -d '/' -f 2 \
					| grep -vE 'kube-system|default' \
					| xargs -t -L1 kubectl --context minikube delete namespace
		case '*'
			command minikube $argv
	end
end
