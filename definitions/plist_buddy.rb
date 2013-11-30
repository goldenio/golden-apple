define :plist_buddy, :action => :set do
  bin = '/usr/libexec/PlistBuddy'
  plist = params[:name]
  plist_name = ::File.basename plist
  key = params[:key]
  type = params[:type]
  value = params[:value]

  case params[:action]
  when :set
    execute "Add #{key} #{type} #{value} to #{plist_name}" do
      command %Q[#{bin} -c 'Add #{key} #{type} #{value}' #{plist}]
      not_if do
        %x[#{bin} -c 'Print #{key}' #{plist}]
      end
    end

    execute "Set #{key} #{value} to #{plist_name}" do
      command %Q[#{bin} -c 'Set #{key} #{value}' #{plist}]
      only_if do
        %x[#{bin} -c 'Print #{key}' #{plist}]
      end
    end
  end
end
