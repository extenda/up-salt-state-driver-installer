# up-salt-state-driver-installer

This salt state installs drivers and configures POS layer files specified for a node in [Fleet Manager](https://github.com/extenda/fleet-manager-api), but right now a [mock](https://github.com/extenda/fleet-manager-mock) is used.

## What it does

The up-driver-installer/init runs the driver packages in the driver-vendor folder depending on what vendor and packages are setup as pillar data.
If testing with kitchen locally the pillar data is specified in the pillar-data folder. Currently the fleet-manager-mock is setup with a number of files in an s3 bucket which this state is downloading during its run. The jpospath.properties file is right now exported in the salt state to the PATH to accommodate the pos-aardvark solution which expects those variables to be available on the path.

## Prerequisites

To be able to run the state locally and run tests, you will need to be running Ruby v2.3.3 or later, and have installed Vagrant and VirtualBox. At a minimum, you will also need to have the bundler gem installed:
```
gem install bundler
```
Once these requirements are met, you can run bundle install from the root of this repo. This will install all required gems for running test-kitchen.

You might also need the vbguest plugin if you're testing real peripherals forwarded to the vagrant box:
```
vagrant plugin install vagrant-vbguest
```

If you want to forward peripherals to you local test-kitchen suite you could update the ./kitchen/kitchen-vagrant/Vagrantfile with similar information as below for your peripherals:
```
config.vm.provider :virtualbox do |vb|
  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  vb.customize ["modifyvm", :id, "--memory", 1024, "--cpus", 2]
  vb.customize ["modifyvm", :id, "--usb", "on"]
  vb.customize ["modifyvm", :id, "--usbehci", "on"]
  vb.customize ["usbfilter", "add", "0",
     "--target", :id,
     "--name", 'Scanner M4100',
     "--vendorid", '0x05f9',
     "--productid", '0x120c',
     "--manufacturer", 'Datalogic ADC Inc.']
  vb.customize ["usbfilter", "add", "1",
     "--target", :id,
     "--name", 'Printer TM-T88V',
     "--vendorid", '0x04b8',
     "--productid", '0x0202',
     "--manufacturer",'EPSON']
  vb.customize ["usbfilter", "add", "2",
     "--target", :id,
     "--name", 'Printer FP-510II',
     "--vendorid", '0x04c5',
     "--productid", '0x117a',
     "--manufacturer",'Fujitsu, Ltd']
end
```

## Running tests

We use test kitchen for testing salt states. The .kitchen.yml file ensures a vagrant box is created in which the salt state will be run. The repo contains pillar data that is a mirror of a mock currently of fleet manager. Depending on the pillar data the state will download packages and files as well as use configuration data defined therein.

To test, open a terminal in the root of the project and run:
```
kitchen converge
kitchen verify
```

We use TDD for this project. So if you want to make changes, first write a test using ServerSpec and then run kitchen verify and watch it fail. Then write the code that will make your test pass. You will need to apply this code to your test VM using a kitchen converge. Then you can run another kitchen verify. Repeat this pattern until all tests pass.
