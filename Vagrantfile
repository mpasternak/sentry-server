Vagrant.configure(2) do |config|

  if Vagrant.has_plugin?("vagrant-hostmanager")
      config.hostmanager.enabled = true
      config.hostmanager.manage_host = true
      config.hostmanager.ignore_private_ip = false
      config.hostmanager.include_offline = true
   end

  config.vm.define "master", primary: true do |master|
      master.vm.box = "ubuntu/xenial64"
      master.vm.box_check_update = false

      master.vm.hostname = 'sentry-server'

      if Vagrant.has_plugin?("vagrant-hostmanager")
          master.hostmanager.aliases = %w(sentry-server.localnet)
      end

      if Vagrant.has_plugin?("vagrant-timezone")
      	 master.timezone.value = :host
      end

      master.vm.provider "virtualbox" do |vb|
          vb.customize ["modifyvm", :id, "--cpus", "2"]
          vb.customize ["modifyvm", :id, "--memory", "2048"]
      end

      master.vm.network "private_network", ip: "192.168.115.100"

      if Vagrant.has_plugin?("vagrant-cachier")
        master.cache.scope = :box
        master.cache.enable :apt
        master.cache.enable :npm
	master.cache.enable :generic, {
	  "wget" => { cache_dir: "/var/cache/wget" },
	}
      end

      master.vm.provision "shell", inline: "sudo apt install python-minimal -y"
      master.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/provision.yml"
      end

  end

end