module Stix2
  module DomainObject
    class ThreatActor < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :threat_actor_types, coerce: ->(v) { validate_array(v, THREAT_ACTOR_TYPE_OV) }
      property :aliases, coerce: [String]
      property :first_seen, coerce: Time
      property :last_seen, coerce: Time
      property :roles, coerce: ->(v) { validate_array(v, THREAT_ACTOR_ROLE_OV) }
      property :goals, coerce: [String]
      property :sophistication, values: THREAT_ACTOR_SOPHISTICATION_OV
      property :resource_level, values: ATTACK_RESOURCE_LEVEL_OV
      property :primary_motivation, values: ATTACK_MOTIVATION_OV
      property :secondary_motivations, coerce: ->(v) { validate_array(v, ATTACK_MOTIVATION_OV) }
      property :personal_motivations, coerce: ->(v) { validate_array(v, ATTACK_MOTIVATION_OV) }
    end
  end
end
