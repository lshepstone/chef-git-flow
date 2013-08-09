include_recipe 'git'

remote_file "#{Chef::Config[:file_cache_path]}/gitflow-installer.sh" do
    action :create_if_missing
    source node['git-flow']['installer_uri']
    user 'root'
    mode 0700
    notifies :run, 'bash[install git-flow]'
end

bash "install git-flow" do
    action :nothing
    environment 'INSTALL_PREFIX' => node['git-flow']['install_prefix'], 'REPO_HOME' => node['git-flow']['repo_uri']
    cwd Chef::Config[:file_cache_path]
    code <<-eos
        #{Chef::Config[:file_cache_path]}/gitflow-installer.sh install
    eos
end
