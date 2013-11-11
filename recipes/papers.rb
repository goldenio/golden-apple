dmg_package 'Papers' do
  source node.papers.source
  checksum node.papers.checksum
  dmg_name node.papers.dmg_name
  accept_eula true
  volumes_dir node.papers.volumes_dir
  app node.papers.app
  action :install
end
