module Stix2
  module DomainObject
    class ThreatActor < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :threat_actor_types, coerce: [String]
      property :aliases, coerce: [String]
      property :first_seen, coerce: Time
      property :last_seen, coerce: Time
      property :roles, coerce: [String]
      property :goals, coerce: [String]
      property :sophistication, values: THREAT_ACTOR_SOPHISTICATION_OV
      property :resource_level, values: ATTACK_RESOURCE_LEVEL_OV
      property :primary_motivation, values: ATTACK_MOTIVATION_OV
      property :secondary_motivations, coerce: [String]
      property :personal_motivations, coerce: [String]

      def initialize(args = {})
        super
        validate_threat_actor_types!
        validate_roles!
        validate_secondary_motivations!
        validate_personal_motivations!
      end

      private

      def validate_threat_actor_types!
        Stix2::Validators::Array.new(threat_actor_types, Stix2::THREAT_ACTOR_TYPE_OV)
      end

      def validate_roles!
        Stix2::Validators::Array.new(roles, Stix2::THREAT_ACTOR_ROLE_OV)
      end

      def validate_secondary_motivations!
        Stix2::Validators::Array.new(secondary_motivations, Stix2::ATTACK_MOTIVATION_OV)
      end

      def validate_personal_motivations!
        Stix2::Validators::Array.new(personal_motivations, Stix2::ATTACK_MOTIVATION_OV)
      end
    end
  end
end
