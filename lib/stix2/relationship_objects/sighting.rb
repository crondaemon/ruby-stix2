module Stix2
  module RelationshipObject
    class Sighting < Base
      property :description, coerce: String
      property :first_seen, required: true, coerce: Time
      property :last_seen, required: true, coerce: Time
      property :count, coerce: Integer
      property :sighting_of_ref, required: true, coerce: String
      property :observed_data_refs, coerce: [String]
      property :where_sighted_refs, coerce: [String]
      property :summary, coerce: Stix2.bool
    end
  end
end
