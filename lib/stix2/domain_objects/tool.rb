module Stix2
  module DomainObject
    class Tool < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :tool_types, coerce: [String]
      property :aliases, coerce: [String]
      property :kill_chain_phases, coerce: [KillChainPhase]
      property :tool_version, coerce: String

      def initialize(args = {})
        super
        validate_tool_types!
      end

      private

      def validate_tool_types!
        Stix2::Validators::Array.new(tool_types, Stix2::TOOL_TYPES_OV)
      end
    end
  end
end
