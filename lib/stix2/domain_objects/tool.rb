module Stix2
  module DomainObject
    class Tool < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :tool_types, coerce: ->(v){ validate_array(v, TOOL_TYPES_OV) }
      property :aliases, coerce: Array[String]
      property :kill_chain_phases, coerce: Array[KillChainPhase]
      property :tool_version, coerce: String
    end
  end
end
