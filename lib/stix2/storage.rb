module Stix2
  @@storage = nil

  def self.storage_add(obj)
    @@storage && @@storage[obj.id.to_s] = obj
  end

  def self.storage_activate
    @@storage = {}
  end

  def self.storage_deactivate
    @storage = nil
  end

  def self.storage_find(id)
    @@storage[id.to_s]
  end

  def self.storage
    @@storage
  end
end
