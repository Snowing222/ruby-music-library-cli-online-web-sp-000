module Concerns::Persistable
  module InstanceMethods
    def save
      self.class.all<<self
    end
  end

  module ClassMethods
    def destroy_all
      all.clear
    end
  end
end
