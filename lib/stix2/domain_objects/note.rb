module Stix2
  module DomainObject
    class Note < Base
      property :abstract, coerce: String
      property :content, coerce: String
      property :authors, coerce: Array[String]
      property :object_refs, coerce: Array[Identifier]
    end
  end
end
