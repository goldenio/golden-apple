default.current_home = node.etc.passwd[node.current_user].dir

default.golden_bash.repository = 'https://github.com/goldenio/golden-bash.git'
default.golden_bash.home = "#{node.current_home}/.golden_bash"
default.golden_bash.theme = 'bobby'
