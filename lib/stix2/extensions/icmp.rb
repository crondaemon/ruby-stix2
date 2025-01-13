module Stix2
  module Extensions
    class Icmp < Stix2::Base
      property :icmp_type_hex, required: true, coerce: String
      property :icmp_code_hex, required: true, coerce: String

      def initialize(args = {})
        super
        validate_icmp_type_hex! if @strict
        validate_icmp_code_hex! if @strict
      end

      private

      def validate_icmp_type_hex!
        Stix2::Validators::Hex.new(icmp_type_hex)
      end

      def validate_icmp_code_hex!
        Stix2::Validators::Hex.new(icmp_code_hex)
      end
    end
  end
end
