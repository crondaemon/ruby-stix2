module Stix2
  module DomainObject
    class IntrusionSet < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :aliases, coerce: [String]
      property :first_seen, coerce: Time
      property :last_seen, coerce: Time
      property :goals, coerce: [String]
      property :resource_level, values: ATTACK_RESOURCE_LEVEL_OV
      property :primary_motivation, values: ATTACK_MOTIVATION_OV
      property :secondary_motivations, coerce: [String]

      def initialize(args = {})
        super
        validate_secondary_motivations!
      end

      private

      def validate_secondary_motivations!
        Stix2::Validators::Array.new(secondary_motivations, Stix2::ATTACK_MOTIVATION_OV)
      end
    end
  end
end
