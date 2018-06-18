# Create Nexus 9k Libvirt Vagrant Box

* Copy a qcow2 image from the Cisco Nexus 9k Download page to this directory

* Create a symlink ``box.img`` to the downloaded image

```
ln -s nxosv-final.7.0.3.I7.3.qcow2 box.img
```

* Create the custom vagrant box

```
tar cvfz ../nexus9k.box metadata.json Vagrantfile box.img nxosv-final.7.0.3.I7.3.qcow2 nxosv_config.iso
```


* Install the custom vagrant box into the default vagrant box location so it can
  be accessed by any vagrantfile loaded on the system. Call the vagrant box
*n9k*

```
vagrant box add ../nexus9k.box --name n9k
rm ../nexus9k.box
```
