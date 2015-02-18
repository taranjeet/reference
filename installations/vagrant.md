Vagrant is an open source tool for building a complete virtual development environment. Very often, a test environment is required for testing the latest release and new tools. Also, it reduces the time spent in re-building your OS. By default, vagrant uses virtualbox for managing the Virtualization. Vagrant acts as the central configuration for managing/deploying multiple reproducible virtual environments with the same configuration.

Installing Virtualbox:

$ sudo apt-get install virtualbox
Installing Vagrant:

$ sudo apt-get install vagrant
Install the dkms package to ensure that the VirtualBox host kernel modules (vboxdrv, vboxnetflt and vboxnetadp) are properly updated if the Linux kernel version changes during the next apt-get upgrade.

$ sudo apt-get install virtualbox-dkms
Getting vagrant  machine up:

Vagrant can quickly deploy the development environment. Get the vagrant images from here. The following command will install precise32 box from the vagrant website. A box is nothing more then a specially packaged image that can later be used to provision a server.

$ vagrant box add precise32 http://files.vagrantup.com/precise32.box
Configure Project:

Create a root directory for your Project. Then create a vagrant file in this folder by calling 'vagrant init', which will be the central file for the project configuration.

$ mkdir vagrant_project
$ cd vagrant_project
$ vagrant init
Edit the Vagrantfile in this directory and replace

config.vm.box = "precise32"
Start Environment:

krishna@krishna-Compaq-510:~/vagrant_project$  vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[default] Importing base box 'precise32'...
[default] Matching MAC address for NAT networking...
[default] Setting the name of the VM...
[default] Clearing any previously set forwarded ports...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Booting VM...
[default] Waiting for machine to boot. This may take a few minutes...
[default] Machine booted and ready!
[default] The guest additions on this VM do not match the installed version of
VirtualBox! In most cases this is fine, but in rare cases it can
prevent things such as shared folders from working properly. If you see
shared folder errors, please make sure the guest additions within the
virtual machine match the version of VirtualBox you have installed on
your host and reload your VM.

Guest Additions Version: 4.2.0
VirtualBox Version: 4.3
[default] Mounting shared folders...
[default] -- /vagrant
krishna@krishna-Compaq-510:~/vagrant_project$
Connect using SSH:

krishna@krishna-Compaq-510:~/vagrant_project$ vagrant ssh
Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)

 * Documentation:  https://help.ubuntu.com/
Welcome to your Vagrant-built virtual machine.
Last login: Fri Sep 14 06:22:31 2012 from 10.0.2.2
vagrant@precise32:~$
