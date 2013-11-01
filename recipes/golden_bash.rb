git node.golden_bash.home do
  repository node.golden_bash.repository
  revision 'master'
  destination node.golden_bash.home
  action :sync
end

template "#{node.current_home}/.bash_profile" do
  source 'golden_bash/bash_profile.erb'
  variables(
    :golden_bash_theme => node.golden_bash.theme
  )
  owner node.current_user
  mode 00644
end

template "#{node.golden_bash.home}/plugins/available/lang.plugins.bash" do
  source 'golden_bash/lang.plugins.bash.erb'
  variables(
    :locale => 'en_US'
  )
  owner node.current_user
  mode 00644
  notifies :run, 'bash[enable lang plugin]', :immediately
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

bash 'enable lang plugin' do
  code <<-CODE
    source #{node.current_home}/.bash_profile
    golden-bash enable plugin lang
  CODE
  action :nothing
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

template "#{node.golden_bash.home}/aliases/available/common.aliases.bash" do
  source 'golden_bash/common.aliases.bash.erb'
  owner node.current_user
  mode 00644
  notifies :run, 'bash[enable common alias]', :immediately
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

bash 'enable common alias' do
  code <<-CODE
    source #{node.current_home}/.bash_profile
    golden-bash enable alias common
  CODE
  action :nothing
  only_if do
    ::File.exists? node.golden_bash.home
  end
end
