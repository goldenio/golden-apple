dmg_package 'Skype' do
  source node.skype.source
  checksum node.skype.checksum
  dmg_name node.skype.dmg_name
  volumes_dir 'Skype'
  app 'Skype'
  action :install
end
