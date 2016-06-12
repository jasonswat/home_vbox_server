default['home_vbox_server']['apt_sources'] = [
  'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' ]
default['home_vbox_server']['pkgs'] = [
  'build-essential',
  'virtualbox',
  'dkms',
  "linux-headers-#{node['kernel']['release']}"
  ]
