module Concerns::Persistable
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end

  module ClassMethods
    def self.destroy_all
      self.all.clear
    end
  end

end
