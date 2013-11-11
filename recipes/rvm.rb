remote_file 'rvm-installer' do
  source 'https://get.rvm.io'
  path node.rvm.installer
  action :create
  not_if do
    ::File.exists? node.rvm.installer
  end
end

execute 'install rvm' do
  command "bash #{node.rvm.installer}"
  not_if do
    ::File.exists? "#{node.rvm.home}/bin/rvm"
  end
end

bash 'rvm requirements' do
  code <<-CODE
    source #{node.current_home}/.bashrc
    source #{node.current_home}/.bash_profile
    rvm autolibs homebrew
    rvm requirements
  CODE
  not_if do
    ::File.exists? '/usr/local/etc/openssl/cert.pem'
  end
end

bash 'install default ruby' do
  code <<-CODE
    source #{node.current_home}/.bashrc
    source #{node.current_home}/.bash_profile
    rvm install #{node.rvm.default_ruby}
    rvm --default use #{node.rvm.default_ruby}
    rvm osx-ssl-certs update all
  CODE
  not_if do
    ::File.exists? "#{node.rvm.home}/bin/#{node.rvm.default_ruby}"
  end
end

template "#{node.golden_bash.home}/plugins/available/rvm.plugins.bash" do
  source 'rvm/rvm.plugins.bash.erb'
  owner node.current_user
  mode 00644
  notifies :run, 'bash[enable rvm plugin]', :immediately
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

bash 'enable rvm plugin' do
  code <<-CODE
    source #{node.current_home}/.bash_profile
    golden-bash enable plugin rvm
  CODE
  action :nothing
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

template 'rvmrc' do
  source 'rvm/rvmrc.erb'
  path "#{node.current_home}/.rvmrc"
end
