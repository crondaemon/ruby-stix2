module Stix2
  module DomainObject
    class AttackPattern < Base
      property :type, required: true, coerce: String
      property :external_references, coerce: Array[Stix2::ExternalReference]
      property :name, coerce: String
      property :description, coerce: String
      property :aliases, coerce: Array[String]
      property :kill_chain_phases, coerce: Array[Stix2::KillChainPhase]
    end
  end
end
