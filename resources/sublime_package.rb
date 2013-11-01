actions :install

attribute :source, :kind_of => String
attribute :path, :kind_of => String
attribute :owner, :kind_of => String

def initialize name, run_content = nil
  super
  @action = :install
end
