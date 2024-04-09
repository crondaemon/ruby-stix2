module Stix2
  module DomainObject
    class Grouping < Base
      property :name, coerce: String
      property :description, coerce: String
      property :context, values: Stix2::GROUPING_CONTEXT_OV
      property :object_refs, coerce: [Identifier]
    end
  end
end
