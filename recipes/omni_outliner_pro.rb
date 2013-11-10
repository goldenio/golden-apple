dmg_package 'OmniOutliner Professional' do
  source node.omni_outliner_pro.source
  checksum node.omni_outliner_pro.checksum
  dmg_name node.omni_outliner_pro.dmg_name
  accept_eula true
  volumes_dir 'OmniOutliner Pro'
  app 'OmniOutliner Professional'
  action :install
end
