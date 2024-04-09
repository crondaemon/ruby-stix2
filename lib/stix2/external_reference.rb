module Stix2
  class ExternalReference < Stix2::Base
    property :source_name, coerce: String, required: true
    property :description, coerce: String
    property :url, coerce: String
    property :hashes, coerce: ->(hsh) { hash_dict(hsh) }
    property :external_id, coerce: String
  end
end
