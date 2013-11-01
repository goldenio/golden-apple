dmg_package 'VirtualBox' do
  source node.virtualbox.source
  checksum node.virtualbox.checksum
  dmg_name node.virtualbox.dmg_name
  volumes_dir 'VirtualBox'
  app 'VirtualBox'
  type 'pkg'
  package_id 'org.virtualbox.pkg.virtualbox'
  action :install
end
