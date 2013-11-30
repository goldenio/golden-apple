file_path = ::File.expand_path(node.eclipse.tarball_name, Chef::Config[:file_cache_path])

remote_file 'fetch Eclipse tarball' do
  source node.eclipse.source
  checksum node.eclipse.checksum
  path "#{file_path}.tar.gz"
  action :create
  not_if do
    ::File.exists? "#{file_path}.tar.gz"
  end
end

execute 'extract Eclipse tarball' do
  cwd Chef::Config[:file_cache_path]
  command "tar -zxf #{node.eclipse.tarball_name}.tar.gz --no-same-owner"
  not_if do
    ::File.exists? ::File.expand_path('eclipse', Chef::Config[:file_cache_path])
  end
end

execute 'install Eclipse' do
  cwd Chef::Config[:file_cache_path]
  command "mv eclipse /Applications"
  not_if do
    ::File.exists? '/Applications/eclipse'
  end
end

directory node.eclipse.tomcat_path

file_path = ::File.expand_path(node.tomcat6.tarball_name, Chef::Config[:file_cache_path])

remote_file 'fetch Tomcat 6 tarball' do
  source node.tomcat6.source
  checksum node.tomcat6.checksum
  path "#{file_path}.tar.gz"
  action :create
  not_if do
    ::File.exists? "#{file_path}.tar.gz"
  end
end

execute 'extract Tomcat 6 tarball' do
  cwd Chef::Config[:file_cache_path]
  command "tar -zxf #{node.tomcat6.tarball_name}.tar.gz -C #{node.eclipse.tomcat_path} --no-same-owner"
  not_if do
    ::File.exists? ::File.expand_path(node.tomcat6.tarball_name, node.eclipse.tomcat_path)
  end
end

file_path = ::File.expand_path(node.tomcat7.tarball_name, Chef::Config[:file_cache_path])

remote_file 'fetch Tomcat 7 tarball' do
  source node.tomcat7.source
  checksum node.tomcat7.checksum
  path "#{file_path}.tar.gz"
  action :create
  not_if do
    ::File.exists? "#{file_path}.tar.gz"
  end
end

execute 'extract Tomcat 7 tarball' do
  cwd Chef::Config[:file_cache_path]
  command "tar -zxf #{node.tomcat7.tarball_name}.tar.gz -C #{node.eclipse.tomcat_path} --no-same-owner"
  not_if do
    ::File.exists? ::File.expand_path(node.tomcat7.tarball_name, node.eclipse.tomcat_path)
  end
end
