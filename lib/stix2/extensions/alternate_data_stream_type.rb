module Stix2
  module Extensions
    class AlternateDataStreamType < Stix2::Base
      property :name, required: true, coerce: String
      property :hashes, coerce: Hash
      property :size, coerce: Integer

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
