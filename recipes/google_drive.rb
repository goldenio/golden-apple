dmg_package 'Google Drive' do
  source node.dropbox.source
  checksum node.dropbox.checksum
  dmg_name 'installgoogledrive'
  volumes_dir 'Install Google Drive'
  app 'Google Drive'
  action :install
end
