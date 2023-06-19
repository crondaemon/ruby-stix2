module Stix2
  module CyberobservableObject
    class Mutex < Base
      property :name, required: true, coerce: String
    end
  end
end
