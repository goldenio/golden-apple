dmg_package 'Google Voice and Video' do
  source node.google_voice_and_video.source
  checksum node.google_voice_and_video.checksum
  dmg_name 'GoogleVoiceAndVideoSetup'
  volumes_dir node.google_voice_and_video.volumes_dir
  app 'Google Voice And Video'
  type 'pkg'
  package_id 'com.google.pkg.GoogleVoiceAndVideo'
  action :install
end
