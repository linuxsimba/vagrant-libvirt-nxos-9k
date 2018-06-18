# Testing Cisco Nexus 9k VM using Vagrant-libvirt

This project is composed of the following parts

* ``lib/`` folder and ``.gemspec`` file Vagrant guest plugin for nxos so that vagrant-libvirt completes successfully
* ``vagrant_box/`` folder with base files to build a custom nexus 9k vagrant box for
  vagrant-libvirt
* ``tests/`` folder with a section to generate a custom Nexus 9k initial config

## Prerequisites

* Vagrant
* Vagrant-libvirt
* Ruby development tools

## Create a Custom vagrant box

Follow the README found in the ``vagrant_box/`` directory to create and install
the custom nexus 9k vagrant box for a libvirt environment.


## Create and install the vagrant-nxos plugin

```
gem build vagrant-nxos.gemspec
vagrant plugin install  vagrant-nxos-1.0.gem
```


## Create a Test environment

* change directory to the ``tests/`` folder.
* modify the ``iso/nxos_config.txt`` to your liking. The default value allows
  the vagrant and admin user to login using the same vagrant insecure key. Its a
good idea to set the ``boot nxos <bootfile>`` command to the version of nexus 9k
software you are using. This way on reboot of the VM it will boot the image and
not send show the ``loader>`` prompt.

* Download the (GNS3 OVMF
  file)[https://sourceforge.net/projects/gns-3/files/Qemu%20Appliances/OVMF-20160813.fd.zip/download] to the ``tests`` directory. This adds UEFI support.
* Run "vagrant init <name of the custom box>" to generate a initial vagrant
  file.

* Start the vagrant VM. Here is an example showing how to pass the necessary
  variables for the UEFI and NXOS config files

```
NXOS_CONFIG_PATH=/home/skamithi/git/vagrant-nxos/tests/ UEFI_LOADER_PATH=/usr/share/ovmf/OVMF.fd vagrant up
```
