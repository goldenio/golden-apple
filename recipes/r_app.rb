include_recipe 'golden-apple::r_script'

project_path = ::File.expand_path(node.r_app.project_name, Chef::Config[:file_cache_path])

remote_file 'fetch R.app tarball' do
  source node.r_app.source
  checksum node.r_app.checksum
  path "#{project_path}.tar.gz"
  action :create
  not_if do
    ::File.exists? "#{project_path}.tar.gz"
  end
end

execute 'extract R.app tarball' do
  cwd Chef::Config[:file_cache_path]
  command "tar -zxf #{node.r_app.project_name}.tar.gz --no-same-owner"
  not_if do
    ::File.exists? project_path
  end
end

execute 'build R.app' do
  cwd project_path
  command "xcodebuild -target R -configuration #{node.r_app.os_type} -project R.xcodeproj ARCHS=x86_64"
  not_if do
    ::File.exists? "#{project_path}/build/#{node.r_app.os_type}/R.app"
  end
end

execute 'install R.app' do
  cwd project_path
  command "mv build/#{node.r_app.os_type}/R.app /Applications"
  not_if do
    ::File.exists? '/Applications/R.app'
  end
end
