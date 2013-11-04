execute 'make bootable install drive' do
  cmd = %W(
    #{Regexp.escape(node.install_media.installer)}/Contents/Resources/createinstallmedia
    --volume #{Regexp.escape(node.install_media.driver)}
    --applicationpath #{Regexp.escape(node.install_media.installer)}
    --nointeraction
  )
  command %Q[sudo #{cmd.join(' ')}]
  only_if do
    ::File.exists? node.install_media.installer and
    ::File.exists? node.install_media.driver
  end
end
