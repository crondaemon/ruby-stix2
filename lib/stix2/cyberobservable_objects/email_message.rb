module Stix2
  module CyberobservableObject
    class EmailMessage < Base
      property :is_multipart, required: true, coerce: Stix2::Boolean
      property :date, coerce: Time
      property :content_type, coerce: String
      property :from_ref, coerce: Identifier
      property :sender_ref, coerce: Identifier
      property :to_refs, coerce: Array[Identifier]
      property :cc_refs, coerce: Array[Identifier]
      property :bcc_refs, coerce: Array[Identifier]
      property :message_id, coerce: String
      property :subject, coerce: String
      property :received_lines, coerce: Array[String]
      property :additional_header_fields, coerce: Hash[String => String]
      property :body, coerce: String
      property :body_multipart, coerce: Array[EmailMimePartType]
      property :raw_email_ref, coerce: Identifier
    end
  end
end
