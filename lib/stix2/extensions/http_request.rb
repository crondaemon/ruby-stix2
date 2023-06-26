module Stix2
  module Extensions
    class HttpRequest < Stix2::Base
      property :request_method, required: true, coerce: String
      property :request_value, required: true, coerce: String
      property :request_version, coerce: String
      property :request_header, coerce: Hash
      property :message_body_length, coerce: Integer
      property :message_body_data_ref, coerce: Identifier
    end
  end
end
