action :install do
  git ::File.expand_path new_resource.name, new_resource.path do
  	repository new_resource.source
  	user new_resource.owner
  	action :sync
  end
end
