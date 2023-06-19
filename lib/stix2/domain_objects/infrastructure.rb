module Stix2
  module DomainObject
    class Infrastructure < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :infrastructure_types, coerce: ->(v){ validate_array(v, Stix2::INFRASTRUCTURE_TYPE_OV) }
      property :aliases, coerce: Array[String]
      property :kill_chain_phases, coerce: Array[KillChainPhase]
      property :first_seen, coerce: Time
      property :last_seen, coerce: Time
    end
  end
end
