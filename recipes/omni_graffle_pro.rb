dmg_package 'OmniGraffle Professional' do
  source node.omni_graffle_pro.source
  checksum node.omni_graffle_pro.checksum
  dmg_name node.omni_graffle_pro.dmg_name
  accept_eula true
  volumes_dir node.omni_graffle_pro.volumes_dir
  app node.omni_graffle_pro.app
  action :install
end
