module Stix2
  module CyberobservableObject
    class EmailMessage < Base
      property :is_multipart, required: true, coerce: ->(value) { Stix2.to_bool(value) }
      property :date, coerce: Time
      property :content_type, coerce: String
      property :from_ref, coerce: Identifier
      property :sender_ref, coerce: Identifier
      property :to_refs, coerce: [Identifier]
      property :cc_refs, coerce: [Identifier]
      property :bcc_refs, coerce: [Identifier]
      property :message_id, coerce: String
      property :subject, coerce: String
      property :received_lines, coerce: [String]
      property :additional_header_fields, coerce: {String => String}
      property :body, coerce: String
      property :body_multipart, coerce: [EmailMimePartType]
      property :raw_email_ref, coerce: Identifier
    end
  end
end
