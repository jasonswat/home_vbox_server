# encoding: utf-8
#
# Cookbook Name:: home_vbox_server 
# Attribute:: default
#
default['home_vbox_server']['apt_sources'] = [
  'deb http://download.virtualbox.org/virtualbox/debian xenial contrib',
  'deb http://download.virtualbox.org/virtualbox/debian trusty contrib' ]
default['home_vbox_server']['pkgs'] = [
  'build-essential',
  'virtualbox',
  'dkms',
  "linux-headers-#{node['kernel']['release']}",
  'linux-headers-generic',
  'xorg',
  'openbox',
  'obconf',
  'openbox-themes',
  'fglrx',
  'firefox'
  ]
