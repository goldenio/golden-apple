dmg_package 'Sublime Text 3' do
  source node.sublime_text.source
  checksum node.sublime_text.checksum
  dmg_name node.sublime_text.dmg_name
  volumes_dir 'Sublime Text'
  app 'Sublime Text'
  action :install
end

link '/usr/local/bin/subl' do
  to node.sublime_text.bin_path
end

node.sublime_text.packages.each do |package|
  golden_apple_sublime_package package[:name] do
    source package[:source]
    path node.sublime_text.packages_path
    action :install
  end
end

node.sublime_text.templates.each do |file|
  template file[:name] do
    source "sublime_text/#{file[:name]}.erb"
    path File.expand_path(file[:name], File.join(node.sublime_text.packages_path, 'User'))
    action :create
  end
end

remote_file 'Package Control.sublime-package' do
  source 'http://sublime.wbond.net/Package%20Control.sublime-package'
  path File.expand_path('Package Control.sublime-package', node.sublime_text.installed_packages_path)
  action :create
end

template "#{node.golden_bash.home}/plugins/available/sublime_text.plugins.bash" do
  source 'sublime_text/sublime_text.plugins.bash.erb'
  owner node.current_user
  mode 00644
  notifies :run, 'bash[enable sublime_text plugin]', :immediately
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

bash 'enable sublime_text plugin' do
  code <<-CODE
    source #{node.current_home}/.bash_profile
    golden-bash enable plugin sublime_text
  CODE
  action :nothing
  only_if do
    ::File.exists? node.golden_bash.home
  end
end
