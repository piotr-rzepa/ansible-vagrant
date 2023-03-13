# ansible-vagrant

Study project for learning Ansible, by automatic/managing various tasks in VMs (worker nodes) provisioned by using Vagrant.

## Vagrant

Vagrant setup consists of two CentOS7 virtual machines, provided by QUEMU/KVM (libvirt) virtualization hypervisors.
To check whether the processor supports virtualization, run:

```bash
cat /proc/cpuinfo`
# `lscpu` is also valid command
```

And look for `vmx` flags (for Intel processors, `svm` for AMD).

The ansible plugin for Vagrant is not used in order to have a vanilla-like Ansible experience automating tasks on remote servers.
In order to use password-less SSH connection to VMs, the public key is injected to `authorized_keys` file for both default user (vagrant) and root.

The default path to file is `$HOME/.ssh/id_rsa.pub`

In order to create an SSH Key Pair, run:

```bash
ssh-keygen -b 2048 -t rsa
```

To download CentOS7 boxes and build VMs using libvirt provider, run:

```bash
vagrant up --provider=libvirt
```

Before running above command, ensure you have [vagrant-libvirt plugin](https://github.com/vagrant-libvirt/vagrant-libvirt) installed.


## Ansible

Non-default inventory files are specified in `inventory/` directory.

Playbooks for automating simple and more complicated tasks are defined in `playbooks/` directory.

Scripts, which are meant to be copied over and/or run on remote client(s) are defined in `scripts/` directory.
