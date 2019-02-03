Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.define "node1" do |node1|
    node1.vm.network "private_network", ip: "192.168.33.10"

    node1.vm.provision "file", source: "./configuration_files/node1.consul.config.json", destination: "consul.config.json"
    node1.vm.provision "file", source: "./configuration_files/node1.setup.sh", destination: "setup.sh"
    node1.vm.provision "file", source: "./configuration_files/node1.consul.service", destination: "consul.service"

    node1.vm.provision "shell", inline: <<-SHELL
      ./setup.sh
    SHELL
  end
  
  config.vm.define "node2" do |node2|
    node2.vm.network "private_network", ip: "192.168.33.11"

    node2.vm.provision "file", source: "./configuration_files/node2.consul.config.json", destination: "consul.config.json"
    node2.vm.provision "file", source: "./configuration_files/node2.setup.sh", destination: "setup.sh"
    node2.vm.provision "file", source: "./configuration_files/node2.consul.service", destination: "consul.service"

    node2.vm.provision "shell", inline: <<-SHELL
      ./setup.sh
    SHELL
  end

  config.vm.define "node3" do |node3|
    node3.vm.network "private_network", ip: "192.168.33.12"

    node3.vm.provision "file", source: "./configuration_files/node3.consul.config.json", destination: "consul.config.json"
    node3.vm.provision "file", source: "./configuration_files/node3.setup.sh", destination: "setup.sh"
    node3.vm.provision "file", source: "./configuration_files/node3.consul.service", destination: "consul.service"

    node3.vm.provision "shell", inline: <<-SHELL
      ./setup.sh
    SHELL
  end
end