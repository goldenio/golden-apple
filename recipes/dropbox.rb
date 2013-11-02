dmg_package 'Dropbox' do
  source node.dropbox.source
  checksum node.dropbox.checksum
  dmg_name node.dropbox.dmg_name
  volumes_dir 'Dropbox Installer'
  app 'Dropbox'
  action :install
end
