module Stix2
  module DomainObject
    class Indicator < Base
      property :name, coerce: String
      property :description, coerce: String
      property :indicator_types, coerce: [String]
      property :indicator_types
      property :pattern, coerce: String
      property :pattern_type, coerce: String, values: PATTERN_TYPE_OV
      property :pattern_version, coerce: String
      property :valid_from, coerce: Time
      property :valid_until, coerce: Time
      property :kill_chain_phases, coerce: [KillChainPhase]

      def initialize(args = {})
        super
        validate_indicator_types!
      end

      private

      def validate_indicator_types!
        Stix2::Validators::Array.new(indicator_types, Stix2::INDICATOR_TYPE_OV)
      end
    end
  end
end
