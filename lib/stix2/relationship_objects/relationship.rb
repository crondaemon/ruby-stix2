module Stix2
  module RelationshipObject
    class Relationship < Base
      property :relationship_type, required: true, coerce: String
      property :description, coerce: String
      property :source_ref, required: true, coerce: String
      property :target_ref, required: true, coerce: String
      property :start_time, coerce: Time
      property :stop_time, coerce: Time
    end
  end
end
