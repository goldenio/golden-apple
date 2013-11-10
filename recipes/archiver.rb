zip_file = File.expand_path("#{node.archiver.zip_name}.zip", Chef::Config[:file_cache_path])

remote_file 'Archiver.zip' do
  source  node.archiver.source
  checksum node.archiver.checksum
  path zip_file
  action :create
  not_if do
    ::File.exists? zip_file
  end
end

execute 'install archiver' do
  command "unzip #{zip_file} -d /Applications"
  not_if do
    ::File.exists? '/Applications/Archiver.app'
  end
end
