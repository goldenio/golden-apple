default.current_home = node.etc.passwd[node.current_user].dir

# default.hipchat.source = 'https://www.hipchat.com/downloads/latest/mac'
default.hipchat.source = 'http://downloads.hipchat.com.s3.amazonaws.com/osx/HipChat-2.4.zip'
default.hipchat.checksum = '93391567ecbf6982e1a6092fd9ac1b32ae1af5a6aa7eabd05555cfb31e438d9e'
default.hipchat.zip_name = 'HipChat-2.4'

default.hipchat.plist = "#{current_home}/Library/Preferences/com.hipchat.HipChat.plist"
default.hipchat.settings = [
  # name, type, value
  # ['disableSounds', 'bool', 'true']
]
