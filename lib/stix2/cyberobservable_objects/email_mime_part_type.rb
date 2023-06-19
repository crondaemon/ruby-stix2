module Stix2
  module CyberobservableObject
    class EmailMimePartType < Base
      property :body, coerce: String
      property :body_raw_ref, coerce: Identifier
      property :content_type, coerce: String
      property :content_disposition, coerce: String
    end
  end
end
