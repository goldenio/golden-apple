package 'mysql'

execute 'add mysql plist to launch agents' do
  command 'ln -sf /usr/local/opt/mysql/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents'
  only_if do
    ::File.exist? '/usr/local/opt/mysql/homebrew.mxcl.mysql.plist'
  end
end

execute 'load mysql as launch daemon' do
  command 'launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist'
  not_if do
    system 'launchctl list homebrew.mxcl.mysql'
  end
end

execute 'assign mysql root password' do
  command %Q[mysqladmin -u root password "#{node.mysql.root_password}"]
  only_if do
    count = %x[mysql -u root -Nse 'show databases;' 2> /dev/null | wc -l]
    count.to_i > 0
  end
end

execute 'insert time zone info' do
  command "mysql_tzinfo_to_sql /usr/share/zoneinfo | sed 's/Local time zone must be set--see zic manual page/XXT/' | mysql -u root -p#{node.mysql.root_password} mysql"
  not_if "mysql -u root -p#{node.mysql.root_password} mysql -e 'select * from time_zone_name;' | grep -q UTC"
end
