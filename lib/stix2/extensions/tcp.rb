module Stix2
  module Extensions
    class Tcp < Stix2::Base
      property :src_flags_hex, coerce: String
      property :dst_flags_hex, coerce: String

      def initialize(args = {})
        super
        validate_src_flags_hex! if @strict
        validate_dst_flags_hex! if @strict
      end

      private

      def validate_src_flags_hex!
        Stix2::Validators::Hex.new(src_flags_hex)
      end

      def validate_dst_flags_hex!
        Stix2::Validators::Hex.new(dst_flags_hex)
      end
    end
  end
end
