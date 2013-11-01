dmg_package 'Source Tree' do
  source node.source_tree.source
  checksum node.source_tree.checksum
  dmg_name node.source_tree.dmg_name
  volumes_dir 'SourceTree'
  app 'SourceTree'
  action :install
end
