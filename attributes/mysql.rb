default.current_home = node.etc.passwd[node.current_user].dir

default.mysql.root_password = 'root'
default.mysql.data_path = '/usr/local/var/mysql'
default.mysql.launch_agent_plist = "#{node.current_home}/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
