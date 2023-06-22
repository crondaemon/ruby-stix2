module Stix2
  module CyberobservableObject
    class X509Certificate < Base
      property :is_self_signed, coerce: ->(v){ Stix2.to_bool(v) }
      property :hashes, coerce: ->(hsh){ hash_dict(hsh) }
      property :version, coerce: String
      property :serial_number, coerce: String
      property :signature_algorithm, coerce: String
      property :issuer, coerce: String
      property :validity_not_before, coerce: Time
      property :validity_not_after, coerce: Time
      property :subject, coerce: String
      property :subject_public_key_algorithm, coerce: String
      property :subject_public_key_modulus, coerce: String
      property :subject_public_key_exponent, coerce: String
      property :x509_v3_extensions, coerce: X509V3ExtensionType
    end
  end
end
