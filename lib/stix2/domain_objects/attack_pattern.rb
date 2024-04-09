module Stix2
  module DomainObject
    class AttackPattern < Base
      property :type, required: true, coerce: String
      property :external_references, coerce: [Stix2::ExternalReference]
      property :name, coerce: String
      property :description, coerce: String
      property :aliases, coerce: [String]
      property :kill_chain_phases, coerce: [Stix2::KillChainPhase]
    end
  end
end
