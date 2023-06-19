module Stix2
  module DomainObject
    class Campaign < Base
      property :name, coerce: String
      property :description, coerce: String
      property :aliases, coerce: Array[String]
      property :first_seen, coerce: Time
      property :last_seen, coerce: Time
      property :objective, coerce: String
    end
  end
end
