module Stix2
  module DomainObject
    class Opinion < Base
      property :explanation, coerce: String
      property :authors, coerce: [String]
      property :opinion, values: OPINION_ENUM
      property :object_refs, coerce: [Identifier]
    end
  end
end
