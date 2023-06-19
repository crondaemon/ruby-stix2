module Stix2
  class ExternalReference < Hashie::Dash
    include Hashie::Extensions::Dash::PredefinedValues
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::Dash::Coercion

    property :source_name, coerce: String, required: true
    property :description, coerce: String
    property :url, coerce: String
    property :hashes, coerce: ->(hsh){ hash_dict(hsh) }
    property :external_id, coerce: String
  end
end
