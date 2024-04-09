module Stix2
  module DomainObject
    class ObservedData < Base
      property :first_observed, required: true, coerce: Time
      property :last_observed, required: true, coerce: Time
      property :number_observed, required: true, coerce: Integer
      property :objects, coerce: Hash
      property :object_refs, coerce: [Identifier]
    end
  end
end
