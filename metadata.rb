name             'golden-apple'
maintainer       'Goldenio, Ltd.'
maintainer_email 'tsechingho@goldenio.com'
license          'MIT'
description      'This cookbook helps you maintain your Mac OS X.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'mac_os_x'

depends 'homebrew', '~> 1.5.0'
depends 'dmg', '~> 2.0.4'
