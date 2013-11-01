helper = JavaHelper.new node.java.oracle.source

golden_apple_oracle_java 'install oracle java' do
  source node.java.oracle.source
  checksum node.java.oracle.checksum
  accept_eula node.java.oracle.accept_oracle_download_terms
  action :install
end

template "#{node.golden_bash.home}/plugins/available/java.plugins.bash" do
  source 'java/java.plugins.bash.erb'
  variables(
    :java_home => helper.java_home
  )
  owner node.current_user
  mode 00644
  notifies :run, 'bash[enable java plugin]', :immediately
  only_if do
    ::File.exists? node.golden_bash.home
  end
end

bash 'enable java plugin' do
  code <<-CODE
    source #{node.current_home}/.bash_profile
    golden-bash enable plugin java
  CODE
  action :nothing
  only_if do
    ::File.exists? node.golden_bash.home
  end
end
