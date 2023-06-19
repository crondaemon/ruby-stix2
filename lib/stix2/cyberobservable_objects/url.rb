module Stix2
  module CyberobservableObject
    class Url < Base
      property :value, required: true, coerce: String
    end
  end
end
