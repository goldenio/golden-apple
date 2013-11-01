action :install do
  helper = JavaHelper.new new_resource.source

  execute 'download java dmg from oracle' do
    command %Q[curl -L --cookie "#{helper.oracle_eula_cookie}" #{new_resource.source} -o #{helper.download_path}]
    only_if do
      new_resource.accept_eula and
      helper.checksum_matched? new_resource.checksum
    end
  end

  dmg_package "install java of oracle" do
    dmg_name helper.file_name.sub('.dmg', '')
    volumes_dir helper.pkg_name
    app helper.pkg_name
    type 'pkg'
    package_id helper.pkg_id
    action :install
    not_if do
      ::File.exists? helper.installed_path
    end
  end
end
