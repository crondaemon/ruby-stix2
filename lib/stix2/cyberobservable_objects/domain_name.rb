module Stix2
  module CyberobservableObject
    class DomainName < Base
      property :value, required: true, coerce: String
      property :resolves_to_refs, coerce: [Identifier]
    end
  end
end
