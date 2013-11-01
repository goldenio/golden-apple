package 'git' do
  not_if do
    node.git.version == 'system'
  end
end

execute 'git config user name' do
  command %Q[git config --global user.name "#{node.git.user_name}"]
  not_if do
    %x[git config --global --get user.name].strip == node.git.user_name
  end
end

execute 'git config user email' do
  command %Q[git config --global user.email "#{node.git.user_email}"]
  not_if do
    %x[git config --global --get user.email].strip == node.git.user_email
  end
end

execute 'git config core editor' do
  command %Q[git config --global core.editor "#{node.git.editor}"]
  not_if do
    %x[git config --global --get core.editor].strip == node.git.editor
  end
end

execute 'git config color ui' do
  command %Q[git config --global color.ui true]
  not_if do
    %x[git config --global --get color.ui].strip == 'true'
  end
end

node.git.alias.each do |name, value|
  execute "git config alias #{name}" do
    command %Q[git config --global alias.#{name} "#{value}"]
    not_if do
      %x[git config --global --get alias.#{name}].strip == value
    end
  end
end

template "#{node.current_home}/.gitconfig" do
  source 'git/gitconfig.erb'
  variables(
    :current_home => node.current_home,
    :user_name => node.git.user_name,
    :user_email => node.git.user_email,
    :editor => node.git.editor,
    :alias => node.git.alias.sort
  )
  owner node.current_user
  mode 00644
end

template "#{node.current_home}/.gitignore_global" do
  source 'git/gitignore_global.erb'
  variables(
    :ignores => node.git.ignores
  )
  owner node.current_user
  mode 00644
end
