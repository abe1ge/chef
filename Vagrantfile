# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure(2) do |config|

	#setting up the synced shared folder
	config.vm.synced_folder "shared", "/tmp/shared"

	#create 3 virtual computers 
	(1..3).each do |i|
		config.vm.define "agent#{i}" do |agent|
		
			# Selecting the box to use
			agent.vm.box = "chad-thompson/ubuntu-trusty64-gui"
		
			# Setting up the network options
			agent.vm.network "public_network", :public_network=> "wlan0",ip:"192.168.1.29#{i}"
			
			#calling the provision bash file
			#config.vm.provision :shell, path:"bootstrap_base.sh"

			if i == 1
				#config.vm.provision "master", type: "shell", path:"bootstrap_chef.sh"
				config.vm.hostname = "chef.local"
			elsif i == 2
				#config.vm.provision "agent", type: "shell", path:"bootstrap_work.sh"
				config.vm.hostname = "work#{i}.local"
			else
				#config.vm.provision "agent", type: "shell", path:"bootstrap_node.sh"
				config.vm.hostname = "node#{i}.local"
			end
			
			#configuring vm provider options
			agent.vm.provider "virtualbox" do |agentVM|
			
				agentVM.gui = true
				agentVM.name="ChefAgent#{i}"
				
				#Setting the amount of RAM the VM has access to
				if i == 1
					agentVM.memory ="4096"
				else 
					agentVM.memory ="2500"
				end
				agentVM.cpus ="2"
			end
	    end	
	end
end