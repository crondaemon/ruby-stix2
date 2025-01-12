module Stix2
  module Extensions
    class WindowsPeSectionType < Stix2::Base
      property :name, required: true, coerce: String
      property :size, coerce: Integer
      property :entropy, coerce: Float
      property :hashes, coerce: Hash

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
