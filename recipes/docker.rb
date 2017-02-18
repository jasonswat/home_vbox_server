# requires Kernels older than 3.10
bash 'install_docker_gpg' do
  code <<-EOH
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    EOH
  not_if 'sudo apt-key list|grep 4096R/2C52609D'
end

directory '/usr/local/bin'

ubuntu_release = `lsb_release -sc`.chomp

bash 'install_docker_sources' do
  code <<-EOH
  echo "deb https://apt.dockerproject.org/repo ubuntu-#{ubuntu_release} main" |tee /etc/apt/sources.list.d/docker.list
    EOH
  not_if { ::File.exist?('/etc/apt/sources.list.d/docker.list') } 
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
  notifies :install, 'package[docker-engine]', :immediately 
end

package 'docker-engine' do
  action :nothing
end

execute 'unzip_packer' do
  command 'unzip /tmp/packer.zip -d /usr/local/bin'
not_if { ::File.exist?('/usr/local/bin/packer') }
end

remote_file '/tmp/packer.zip' do
  source node['home_vbox_server']['packer_url'] 
  mode '0755'
  action :create
notifies :run, resources(:execute => 'unzip_packer'), :immediately
end

