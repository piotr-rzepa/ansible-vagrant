# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV["VAGRANT_DEFAULT_PROVIDER"] = "libvirt"

# Running vagrant commands as root, but the SSH key is located in this user home directory
ENV["HOME_DIR_USERNAME"] = "/home/piotr"

Vagrant.configure("2") do |config|

  config.vm.define "ansible-client1" do |ansible_client1|
    ansible_client1.vm.box = "centos/7"
    ansible_client1.vm.synced_folder '.', '/vagrant', disabled: true
    ansible_client1.vm.box_check_update = false
    ansible_client1.vm.hostname = "client1"
    ansible_client1.vm.network "public_network", ip: "192.168.1.250",
      :dev => "eno1"

    # Inject own SSH key to enable password-less ssh conenction
    ssh_pub_key = File.readlines("#{ENV['HOME_DIR_USERNAME']}/.ssh/id_rsa.pub").first.strip
    ansible_client1.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
    ansible_client1.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
    ansible_client1.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
    ansible_client1.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end

  config.vm.define "ansible-client2" do |ansible_client2|
    ansible_client2.vm.box = "centos/7"
    ansible_client2.vm.synced_folder '.', '/vagrant', disabled: true
    ansible_client2.vm.box_check_update = false
    ansible_client2.vm.hostname = "client2"
    ansible_client2.vm.network "public_network", ip: "192.168.1.251",
      :dev => "eno1"
    # Inject own SSH key to enable password-less ssh conenction
    ssh_pub_key = File.readlines("#{ENV['HOME_DIR_USERNAME']}/.ssh/id_rsa.pub").first.strip
    ansible_client2.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
    ansible_client2.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
    ansible_client2.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
    ansible_client2.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end
end
