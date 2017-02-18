# encoding: utf-8
#
# Cookbook Name:: home_vbox_server 
# Attribute:: default
#
default['home_vbox_server']['user'] = 'swatnix'
default['home_vbox_server']['default_shell'] = '/bin/zsh'
default['home_vbox_server']['nas'] = '192.168.10.184:/i-data/1c2707a0/'
default['home_vbox_server']['packer_url'] = 'https://releases.hashicorp.com/packer/0.12.0/packer_0.12.0_linux_amd64.zip'
default['home_vbox_server']['apt_sources'] = [
  'deb http://download.virtualbox.org/virtualbox/debian xenial contrib',
  'deb http://download.virtualbox.org/virtualbox/debian trusty contrib' ]
default['home_vbox_server']['pkgs'] = [
  'alsa-base',
  'alsa-utils',
  'apt-transport-https',
  'bluez',
  'bluez-alsa',
  'build-essential',
  'ca-certificates',
  'curl',
  'dkms',
  'fglrx',
  'firefox',
  'gstreamer0.10-alsa',
  'gstreamer0.10-plugins-base-apps',
  'gstreamer0.10-pulseaudio',
  'gstreamer1.0-alsa',
  'gstreamer1.0-plugins-base-apps', 
  'gstreamer1.0-pulseaudio',
  'htop',
  'keepass2',
  'libxss1',
  'libappindicator1',
  'libindicator7',
  "linux-headers-#{node['kernel']['release']}",
  'linux-headers-generic',
  "linux-image-extra-#{node['kernel']['release']}",
  'linux-image-extra-virtual',
  'nfs-common',
  'nmap',
  'pulseaudio',
  'ruby',
  'ruby-childprocess',
  'ruby-erubis',
  'ruby-ffi',
  'ruby-i18n',
  'ruby-log4r',
  'ruby-net-scp',
  'ruby-net-ssh',
  'synaptic',
  'tango-icon-theme-extras',
  'ubuntu-restricted-extras',
  'unzip',
  'vim',
  'virtualbox',
  'vlc',
  'wireless-tools',
  'wicd',
  'wpasupplicant',
  'xfce4-mixer',
  'xfce4-goodies',
  'xfwm4-themes',
  'xorg',
  'xscreensaver',
  'xscreensaver-data',
  'xscreensaver-data-extra',
  'xscreensaver-gl',
  'xscreensaver-gl-extra',
  'xterm',
  'zsh'
  ]
