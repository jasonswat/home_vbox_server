# encoding: utf-8
# Cookbook Name: home_vbox_server
# Recipe: virtual_box 

['debian-keyring', 'debian-archive-keyring'].each do |pkg|
  package pkg do
    options '--force-yes'
  end
end

execute 'install_virtualbox_key' do
    command 'apt-key add /var/tmp/oracle_vbox.asc'
end

template "/etc/apt/sources.list.d/#{@cookbook_name}.list" do
  source 'sources.erb'
  mode '0755'
  owner 'root'
  group 'root'
  variables(
      resource: self,
  )
  notifies :run, 'execute[apt-get-update]', :immediately
end

remote_file '/var/tmp/oracle_vbox.asc' do
  source 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :run, 'execute[install_virtualbox_key]', :immediately
end

node['home_vbox_server']['pkgs'].each do |pkg|
    package pkg
end
