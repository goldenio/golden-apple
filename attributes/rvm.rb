default.current_home = node.etc.passwd[node.current_user].dir

default.rvm.installer = "#{Chef::Config[:file_cache_path]}/rvm-installer"
default.rvm.home = "#{node.current_home}/.rvm"
default.rvm.default_ruby = 'ruby-2.0.0-p247'
