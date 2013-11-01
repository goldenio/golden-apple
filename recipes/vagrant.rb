dmg_package 'Vagrant' do
  source node.vagrant.source
  checksum node.vagrant.checksum
  dmg_name node.vagrant.dmg_name
  volumes_dir 'Vagrant'
  app 'Vagrant'
  type 'pkg'
  package_id 'com.vagrant.vagrant'
  action :install
end

node.vagrant.plugins.each do |plugin|
  execute "install vagrant plugin #{plugin}" do
    command "vagrant plugin install #{plugin}"
    not_if do
      count = %x[vagrant plugin list | grep #{plugin} | wc -l]
      count.to_i > 0
    end
  end
end
