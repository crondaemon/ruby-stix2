module Stix2
  module DomainObject
    class Infrastructure < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :infrastructure_types, coerce: [String]
      property :aliases, coerce: [String]
      property :kill_chain_phases, coerce: [KillChainPhase]
      property :first_seen, coerce: Time
      property :last_seen, coerce: Time

      def initialize(args = {})
        super
        validate_infrastructure_types! if @strict
      end

      private

      def validate_infrastructure_types!
        Stix2::Validators::Array.new(infrastructure_types, Stix2::INFRASTRUCTURE_TYPE_OV)
      end
    end
  end
end
