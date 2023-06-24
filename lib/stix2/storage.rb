module Stix2
  class Storage
    @@storage = nil

    def self.add(obj)
      @@storage && @@storage[obj.id.to_s] = obj
    end

    def self.activate
      @@storage = {}
    end

    def self.deactivate
      @@storage = nil
    end

    def self.find(id)
      @@storage[id.to_s]
    end

    def self.inspect
      @@storage.inspect
    end
  end
end
