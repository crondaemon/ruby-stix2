module Stix2
  module CyberobservableObject
    class MacAddr < Base
      property :value, required: true, coerce: String
    end
  end
end
