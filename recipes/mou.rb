zip_file = File.expand_path('Mou.zip', Chef::Config[:file_cache_path])

remote_file 'Mou.zip' do
  source  node.mou.source
  checksum node.mou.checksum
  path zip_file
  action :create
  not_if do
    ::File.exist? zip_file
  end
end

execute 'install mou' do
  command "unzip #{zip_file} -d /Applications"
  not_if do
    ::File.exist? '/Applications/Mou.app'
  end
end
