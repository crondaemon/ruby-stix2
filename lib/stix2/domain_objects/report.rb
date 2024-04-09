module Stix2
  module DomainObject
    class Report < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :report_types, coerce: ->(v) { validate_array(v, Stix2::REPORT_TYPE_OV) }
      property :published, coerce: Time
      property :object_refs, coerce: [Identifier]
    end
  end
end
