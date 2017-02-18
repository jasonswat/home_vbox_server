['Desktop/keepass', 'Desktop/photo'].each do |dir|
  directory "/home/#{node['home_vbox_server']['user']}/#{dir}" do
    owner node['home_vbox_server']['user']
    group node['home_vbox_server']['user']
    mode '0755'
    action :nothing
  end
end

mount "/home/#{node['home_vbox_server']['user']}/Desktop/keepass" do
  device "#{node['home_vbox_server']['nas']}backup/database"
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end

mount "/home/#{node['home_vbox_server']['user']}/Desktop/photo" do
  device "#{node['home_vbox_server']['nas']}photo"
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end

# setup zsh
ruby_block 'change_default_shell' do
  current_shell = `getent passwd #{node['home_vbox_server']['user']} |awk -F: '{print $7}'`
  if current_shell != node['home_vbox_server']['default_shell']
    `sudo chsh -s #{node['home_vbox_server']['default_shell']} #{node['home_vbox_server']['user']}`
  end
  not_if { current_shell = node['home_vbox_server']['default_shell'] }
end

execute 'install_ohmyzsh' do
  cwd "/home/#{node['home_vbox_server']['user']}"
  user node['home_vbox_server']['user'] 
  command 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
  not_if { File.exist?("/home/#{node['home_vbox_server']['user']}/.oh-my-zsh") }
end

execute 'add_chrome_repo' do
  code <<-EOH
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  EOH
  not_if { File.exist?('/etc/apt/sources.list.d/chrome.list') }
  notifies :install, 'apt_package[chrome]', :immediately
end

apt_package 'chrome' do
  action :nothing
end
