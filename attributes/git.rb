default.current_home = node.etc.passwd[node.current_user].dir

default.git.version = 'system'
default.git.user_name = 'Tse-Ching Ho'
default.git.user_email = 'tsechingho@gmail.com'
default.git.editor = 'subl -w'
default.git.alias = {
  :br => 'branch',
  :ci => 'commit',
  :co => 'checkout',
  :st => 'status',
  :tree => 'log --graph --decorate --pretty=oneline --abbrev-commit --all',
  :stack => "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
}
default.git.ignores = %W{
}
