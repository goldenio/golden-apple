include_recipe 'golden-apple::r_script'

dmg_package 'RStudio' do
  source node.r_studio.source
  checksum node.r_studio.checksum
  dmg_name node.r_studio.dmg_name
  volumes_dir node.r_studio.volumes_dir
  app 'RStudio'
  action :install
end
