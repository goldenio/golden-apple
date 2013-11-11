include_recipe 'golden-apple::xquartz'

homebrew_tap 'homebrew/science'

package 'r'

execute 'link R framework path' do
  command 'sudo ln -s /usr/local/opt/r/R.framework /Library/Frameworks'
  not_if do
    ::File.exists? '/Library/Frameworks/R.framework'
  end
end

execute 'set R config JAVA_CPPFLAGS' do
  command "R CMD javareconf JAVA_CPPFLAGS=#{node.r_script.java_cppflags}"
  not_if do
    %x[R CMD config JAVA_CPPFLAGS].strip == node.r_script.java_cppflags
  end
end
