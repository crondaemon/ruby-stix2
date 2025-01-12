require "stix2/cyberobservable_objects/x509_v3_extension_type"

module Stix2
  module CyberobservableObject
    class X509Certificate < Base
      property :is_self_signed, coerce: Stix2.bool
      property :hashes, coerce: Hash
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

      def initialize(args = {})
        super
        validate_hashes!
      end

      private

      def validate_hashes!
        Stix2::Validators::Hashes.new(hashes)
      end
    end
  end
end
