dmg_package 'JavaForOSX' do
  source node.java.apple.source
  checksum node.java.apple.checksum
  dmg_name node.java.apple.dmg_name
  volumes_dir node.java.apple.volumes_dir
  app 'JavaForOSX'
  type 'pkg'
  package_id node.java.apple.package_id
  action :install
end

template "#{node.golden_bash.home}/plugins/available/java6.plugins.bash" do
  source 'java/java6.plugins.bash.erb'
  variables(
    :java_home => node.java.apple.java_home
  )
  owner node.current_user
  mode 00644
  notifies :run, 'bash[enable java6 plugin]', :immediately
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

bash 'enable java6 plugin' do
  code <<-CODE
    source #{node.current_home}/.bash_profile
    golden-bash enable plugin java6
  CODE
  action :nothing
  only_if do
    ::File.exists? node.golden_bash.home
  end
end
