# encoding: utf-8
#
# Cookbook Name:: home_vbox_server 
# Attribute:: default
#
default['home_vbox_server']['user'] = 'swatnix'
default['home_vbox_server']['default_shell'] = '/bin/zsh'
default['home_vbox_server']['nas'] = '192.168.10.184:/i-data/1c2707a0/'
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
  "linux-headers-#{node['kernel']['release']}",
  'linux-headers-generic',
  "linux-image-extra-#{node['kernel']['release']}",
  'linux-image-extra-virtual',
  'nfs-common',
  'nmap',
  'pulseaudio',
  'tango-icon-theme-extras',
  'ubuntu-restricted-extras',
  'vim',
  'virtualbox',
  'vlc',
  'wireless-tools',
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
