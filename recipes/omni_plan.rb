dmg_package 'OmniPlan' do
  source node.omni_plan.source
  checksum node.omni_plan.checksum
  dmg_name node.omni_plan.dmg_name
  accept_eula true
  volumes_dir 'OmniPlan'
  app 'OmniPlan'
  action :install
end
