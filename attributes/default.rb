# encoding: utf-8
#
# Cookbook Name:: home_vbox_server 
# Attribute:: default
#
default['home_vbox_server']['apt_sources'] = [
  'deb http://download.virtualbox.org/virtualbox/debian xenial contrib',
  'deb http://download.virtualbox.org/virtualbox/debian trusty contrib' ]
default['home_vbox_server']['pkgs'] = [
  'alsa-base',
  'alsa-utils',
  'bluez',
  'bluez-alsa',
  'build-essential',
  'virtualbox',
  'dkms',
  'gstreamer0.10-alsa',
  'gstreamer0.10-plugins-base-apps',
  'gstreamer0.10-pulseaudio',
  'gstreamer1.0-alsa',
  'gstreamer1.0-plugins-base-apps', 
  'gstreamer1.0-pulseaudio',
  "linux-headers-#{node['kernel']['release']}",
  'linux-headers-generic',
  'xorg',
  'pulseaudio',
  'fglrx',
  'firefox',
  'ubuntu-restricted-extras',
  'wireless-tools',
  'wpasupplicant',
  'xterm'
  ]
