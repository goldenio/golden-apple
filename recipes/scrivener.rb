dmg_package 'Scrivener' do
  source node.scrivener.source
  checksum node.scrivener.checksum
  dmg_name 'Scrivener'
  accept_eula true
  volumes_dir 'Scrivener'
  app 'Scrivener'
  action :install
end
