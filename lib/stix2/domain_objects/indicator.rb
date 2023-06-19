module Stix2
  module DomainObject
    class Indicator < Base
      property :name, coerce: String
      property :description, coerce: String
      property :indicator_types, coerce: ->(v){ validate_array(v, Stix2::INDICATOR_TYPE_OV) }
      property :pattern, coerce: String
      property :pattern_type, coerce: String, values: PATTERN_TYPE_OV
      property :pattern_version, coerce: String
      property :valid_from, coerce: Time
      property :valid_until, coerce: Time
      property :kill_chain_phases, coerce: Array[KillChainPhase]
    end
  end
end
