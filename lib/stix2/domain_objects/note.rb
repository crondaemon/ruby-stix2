module Stix2
  module DomainObject
    class Note < Base
      property :abstract, coerce: String
      property :content, coerce: String
      property :authors, coerce: [String]
      property :object_refs, coerce: [Identifier]
    end
  end
end
