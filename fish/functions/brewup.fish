function brewup
  brew update

  set -lx outdated_brews (brew outdated)
  if count $outdated_brews
  	brew upgrade $outdated_brews
  	brew cleanup
  else
  	echo "Everything up to date"
  end

	if brew list | grep -q docker-machine
		for machine in (docker-machine ls -q --filter "driver=virtualbox")
			docker-machine stop $machine
		end
	end

	if brew cask list -1 | grep -q vagrant
		echo "Stopping running vagrant machines"

		vagrant global-status | grep running | awk '{print $1}' | xargs -L1 vagrant halt
	end

	if brew cask list -1 | grep -q virtualbox
		set -lx running_vms (vboxmanage list runningvms |  cut -d '{' -f 2 | cut -d '}' -f 1)

		if count $running_vms
			echo "Stopping running virtualbox machines"
			echo $running_vms | xargs -L1 -I {} VBoxManage controlvm {} acpipowerbutton
		end
	end

	for cask in (brew cask list -1)
		brew cask install --force $cask
	end
end
