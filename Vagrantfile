# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
  config.ssh.insert_key = false
  
  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "docker" do |docker|
    docker.vm.box = "merev/debian-11"
    docker.vm.hostname = "docker.do1.lab"
    docker.vm.network "private_network", ip: "192.168.99.102"
    docker.vm.provision "shell", path: "provision-scripts/add_hosts.sh"
    docker.vm.provision "shell", path: "provision-scripts/install_docker.sh"
    docker.vm.provision "shell", path: "provision-scripts/setup_gitea.sh"
    docker.vm.synced_folder "shared-files/", "/vagrant"
  end

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box="merev/debian-11"
    jenkins.vm.hostname = "jenkins.do1.lab"
    jenkins.vm.network "private_network", ip: "192.168.99.101"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
    jenkins.vm.provision "shell", path: "provision-scripts/add_hosts.sh"
    jenkins.vm.provision "shell", path: "provision-scripts/install_jenkins.sh"
    jenkins.vm.provision "shell", path: "provision-scripts/setup_jenkins.sh"
    jenkins.vm.synced_folder "shared-files/", "/vagrant"
  end
end