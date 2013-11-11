dmg_package 'XQuartz' do
  source node.xquartz.source
  checksum node.xquartz.checksum
  dmg_name node.xquartz.dmg_name
  volumes_dir node.xquartz.volumes_dir
  app 'XQuartz'
  type 'pkg'
  package_id 'org.macosforge.xquartz.pkg'
  action :install
end
