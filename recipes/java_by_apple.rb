dmg_package 'JavaForOSX' do
  source node.java.apple.source
  checksum node.java.apple.checksum
  dmg_name node.java.apple.dmg_name
  volumes_dir node.java.apple.volumes_dir
  app 'JavaForOSX'
  type 'pkg'
  package_id node.java.apple.package_id
  action :install
end
