package 'postgresql'

execute "initdb #{node.postgresql.data_path} -E utf8" do
  not_if do
    ::File.exists? node.postgresql.data_path
  end
end

execute 'add postgresql plist to launch agents' do
  command 'ln -sf /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents'
  not_if do
    ::File.exists? node.postgresql.launch_agent_plist
  end
end

execute 'load postgresql as launch daemon' do
  command "launchctl load #{node.postgresql.launch_agent_plist}"
  not_if do
    system 'launchctl list homebrew.mxcl.postgresql > /dev/null'
  end
end
