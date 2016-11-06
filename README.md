## Installs virtualbox server on a minimal install of ubuntu server 16.04

I used my tftpd_server cookbook to build the base ubuntu image, then this cookbook will be used to
configure and install virtualbox and any other utilities

This is a work in progress, I will remove this when completed

Prereq, it needs chef to be installed. For the vm, I installed it manaully for the PXE boot version, I added the chef install to the preseed file. Here are the steps to install manually:

```
wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.14.25-1_amd64.deb
sudo dpkg -i chefdk_0.14.25-1_amd64.deb
mkdir cookbooks
cd cookbooks
git clone https://github.com/jasonswat/home_vbox_server.git
cd home_vbox_server
sudo ./install
```

To setup the amd drivers
```
sudo amdconfig --initial
```

## Testing with Packer Image

Using packer to create a test machine to run with kitchen. There is a packer template if you want to create a virtualbox image to test with. You need to install packer if you don't already have it. This assumes your on a mac and have homebrew installed:

```
brew install packer
```

To validate the template:

```
packer validate ubuntu.packer
```

To build the vbox image:

```
packer build ubuntu.packer
```

```
kitchen create
kitchen converge
```
