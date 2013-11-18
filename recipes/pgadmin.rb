dmg_package 'PostgreSQL admin' do
  source node.pgadmin.source
  checksum node.pgadmin.checksum
  dmg_name node.pgadmin.dmg_name
  accept_eula true
  volumes_dir node.pgadmin.volumes_dir
  app node.pgadmin.app
  action :install
end
