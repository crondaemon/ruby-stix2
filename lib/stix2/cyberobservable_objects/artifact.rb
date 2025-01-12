module Stix2
  module CyberobservableObject
    class Artifact < Base
      property :mime_type, coerce: String
      property :payload_bin, coerce: String
      property :url, coerce: String
      property :hashes, coerce: Hash
      property :encryption_algorithm, values: ENCRYPTION_ALGORITHM_ENUM
      property :decryption_key, coerce: String

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
