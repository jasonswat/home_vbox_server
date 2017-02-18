username = node['home_vbox_server']['user']

['vim', 'vim/bin', 'vim/bundle', 'vim/autoload', 'bin', ].each do |dir|
  directory "/home/#{node['home_vbox_server']['user']}/#{dir}" do
    owner node['home_vbox_server']['user']
    group node['home_vbox_server']['user']
    mode '0755'
    recursive true
  end
end

template "/home/#{username}/bin/vim" do
  source 'vim.erb'
  mode '0755'
  owner node['home_vbox_server']['user']
  group node['home_vbox_server']['user']
  variables(
    :username => username
  )
end

bash 'install_vim_pathogen' do
  code <<-EOH
    curl -LSso "/home/#{username}/vim/autoload/pathogen.vim" #{node['home_vbox_server']['vim_pathogen_src']}
  EOH
  action :run
  not_if { ::File.exists?("/home/#{username}/vim/autoload/pathogen.vim") }
end

link "/home/#{username}/.vim/bundle" do
  to "/home/#{username}/vim/bundle"
end

node['home_vbox_server']['vim_pathogen'].each do |repo |
  repo_name = File.basename(repo, ".git")
  git "/home/#{username}/vim/bundle/#{repo_name}" do
    repository repo
    action :sync
 end
end
