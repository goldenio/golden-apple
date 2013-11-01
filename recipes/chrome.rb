dmg_package 'Google Chrome' do
  source node.chrome.source
  checksum node.chrome.checksum
  dmg_name 'googlechrome'
  volumes_dir 'Google Chrome'
  app 'Google Chrome'
  action :install
end
