default.current_home = node.etc.passwd[node.current_user].dir

default.postgresql.root_password = ''
default.postgresql.data_path = '/usr/local/var/postgres'
default.postgresql.launch_agent_plist = "#{node.current_home}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
