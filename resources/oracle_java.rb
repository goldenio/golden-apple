actions :install

attribute :source, :regex => /^(file|https?):\/\/.*(tar.gz|tgz|bin|zip|dmg)$/, :default => nil
attribute :checksum, :regex => /^[a-zA-Z0-9]{40,64}$/, :default => nil
attribute :accept_eula, :kind_of => [TrueClass, FalseClass], :default => false

def initialize name, run_content = nil
  super
  @action = :install
end
