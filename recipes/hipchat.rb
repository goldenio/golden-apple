zip_file = ::File.expand_path("#{node.hipchat.zip_name}.zip", Chef::Config[:file_cache_path])

remote_file 'HipChat.zip' do
  source node.hipchat.source
  checksum node.hipchat.checksum
  path zip_file
  action :create
  not_if do
    ::File.exists? zip_file
  end
end

execute 'install hipchat' do
  command "unzip #{zip_file} -d /Applications"
  not_if do
    ::File.exists? '/Applications/HipChat.app'
  end
end

node.hipchat.settings.each do |name, type, value|
  plist_buddy node.hipchat.plist do
    key name
    type type
    value value
  end
end
