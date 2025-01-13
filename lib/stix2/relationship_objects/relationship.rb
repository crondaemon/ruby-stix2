module Stix2
  module RelationshipObject
    class Relationship < Base
      property :relationship_type, required: true, coerce: String
      property :description, coerce: String
      property :source_ref, required: true, coerce: String
      property :target_ref, required: true, coerce: String
      property :start_time, coerce: Time
      property :stop_time, coerce: Time

      def initialize(args = {})
        if !args[:relationship_type] && args[:source_ref] && args[:target_ref]
          objects = DOMAIN_OBJECTS + CYBEROBSERVABLE_OBJECTS
          source_type = type_by_id(args[:source_ref])
          target_type = type_by_id(args[:target_ref])
          relationships = Array(RELATIONSHIP_TYPES.dig(source_type, target_type))
          relationships += COMMON_RELATIONSHIPS if objects.include?(source_type) && objects.include?(target_type)
          args[:relationship_type] = relationships.first unless relationships.empty?
        end

        super
        validate_relationship_type!
      end

      COMMON_RELATIONSHIPS = ["related-to", "derived-from", "duplicate-of"].freeze
      DOMAIN_OBJECTS = ["attack-pattern", "campaign", "course-of-action", "grouping", "identity", "indicator",
        "intrusion-set", "location", "malware-analysis", "malware", "note", "observed-data", "opinion", "report",
        "threat_actor", "tool", "vulnerability"].freeze
      CYBEROBSERVABLE_OBJECTS = ["artifact", "autonomous-system", "directory", "domain-name", "email-addr",
        "email-message", "file", "ipv4-addr", "ipv6-addr", "mac-addr", "mutex", "network-traffic", "process",
        "software", "url", "user-account", "windows-registry-key", "x509-certificate"].freeze

      RELATIONSHIP_TYPES = {
        "attack-pattern" => {
          "identity" => "targets",
          "location" => "targets",
          "malware" => ["delivers", "uses"],
          "tool" => "uses",
          "vulnerability" => "targets"
        },
        "campaign" => {
          "attack-pattern" => "uses",
          "identity" => "targets",
          "infrastructure" => ["compromises", "uses"],
          "intrusion-set" => "attributed-to",
          "location" => ["originates-from", "targets"],
          "malware" => "uses",
          "threat-actor" => "attributed-to",
          "tool" => "uses",
          "vulnerability" => "targets"
        },
        "course-of-action" => {
          "attack-pattern" => "mitigates",
          "indicator" => ["investigates", "mitigates"],
          "malware" => ["mitigates", "remediates"],
          "tool" => "mitigates",
          "vulnerability" => ["mitigates", "remediates"]
        },
        "domain-name" => {
          "domain-name" => "resolves-to",
          "ipv4-addr" => "resolves-to",
          "ipv6-addr" => "resolves-to"
        },
        "identity" => {
          "location" => "located-at"
        },
        "indicator" => {
          "attack-pattern" => "indicates",
          "campaign" => "indicates",
          "infrastructure" => "indicates",
          "intrusion-set" => "indicates",
          "malware" => "indicates",
          "observed-data" => "based-on",
          "threat-actor" => "indicates",
          "tool" => "indicates"
        },
        "infrastructure" => {
          "artifact" => "communicates-with",
          "autonomous-system" => "communicates-with",
          "directory" => "communicates-with",
          "domain-name" => ["communicates-with", "consists-of"],
          "email-addr" => "communicates-with",
          "email-message" => "communicates-with",
          "file" => "communicates-with",
          "infrastructure" => ["communicates-with", "consists-of", "controls", "uses"],
          "ipv4-addr" => ["communicates-with", "consists-of"],
          "ipv6-addr" => ["communicates-with", "consists-of"],
          "location" => "located-at",
          "mac-addr" => "communicates-with",
          "malware" => ["controls", "delivers", "hosts"],
          "mutex" => "communicates-with",
          "network-traffic" => "communicates-with",
          "observed-data" => "consists-of",
          "process" => "communicates-with",
          "software" => "communicates-with",
          "tool" => "hosts",
          "url" => ["communicates-with", "consists-of"],
          "user-account" => "communicates-with",
          "vulnerability" => "has",
          "windows registry-key" => "communicates-with",
          "x509-certificate" => "communicates-with"
        },
        "intrusion-set" => {
          "attack-pattern" => "uses",
          "identity" => "targets",
          "infrastructure" => ["compromises", "hosts", "owns", "uses"],
          "location" => ["originates-from", "targets"],
          "malware" => "uses",
          "threat-actor" => "attributed-to",
          "tool" => "uses",
          "vulnerability" => "targets"
        },
        "ipv4-addr" => {
          "mac-addr" => "resolves-to",
          "autonomous-system" => "belongs-to"
        },
        "ipv6-addr" => {
          "mac-addr" => "resolves-to",
          "autonomous-system" => "belongs-to"
        },
        "malware" => {
          "attack-pattern" => "uses",
          "domain-name" => "communicates-with",
          "identity" => "targets",
          "infrastructure" => ["beacons-to", "exfiltrates-to", "targets", "uses"],
          "intrusion-set" => "authored-by",
          "ipv4-addr" => "communicates-with",
          "ipv6-addr" => "communicates-with",
          "location" => ["originates-from", "targets"],
          "malware" => ["controls", "downloads", "drops", "uses", "variant-of"],
          "threat-actor" => "authored-by",
          "tool" => ["downloads", "drops", "uses"],
          "url" => "communicates-with",
          "vulnerability" => ["exploits", "targets"]
        },
        "malware-analysis" => {
          "malware" => ["characterizes", "av-analysis-of", "static-analysis-of", "dynamic-analysis-of"]
        },
        "threat-actor" => {
          "attack-pattern" => "uses",
          "identity" => ["attributed-to", "impersonates", "targets"],
          "infrastructure" => ["compromises", "hosts", "owns", "uses"],
          "location" => ["located-at", "targets"],
          "malware" => "uses",
          "tool" => "uses",
          "vulnerability" => "targets"
        },
        "tool" => {
          "identity" => "targets",
          "infrastructure" => ["targets", "uses"],
          "location" => "targets",
          "malware" => ["delivers", "drops"],
          "vulnerability" => ["has", "targets"]
        }
      }.freeze

      private_constant :COMMON_RELATIONSHIPS, :DOMAIN_OBJECTS, :CYBEROBSERVABLE_OBJECTS, :RELATIONSHIP_TYPES

      private

      def type_by_id(id)
        id.split("--").first
      end

      def validate_relationship_type!
        relationship_type.match?(/[a-z0-9-]/) || raise(Exception::InvalidValues.new(relationship_type))
      end
    end
  end
end
