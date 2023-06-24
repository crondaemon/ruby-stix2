module Stix2
  SPEC_VERSIONS = ['2.1']

  class Common < Stix2::Base
    property :type, required: true, coerce: String
    property :spec_version, coerce: String, values: Stix2::SPEC_VERSIONS
    property :id, coerce: Identifier
    property :created_by_ref, coerce: Identifier
    property :created, coerce: Time
    property :modified, coerce: Time
    property :revoked, coerce: ->(value){ Stix2.to_bool(value) }
    property :labels, coerce: Array[String]
    property :confidence, coerce: Integer
    property :lang, coerce: String
    property :external_references, coerce: Array[ExternalReference]
    property :object_marking_refs, coerce: Array[Stix2::MetaObject::DataMarking::ObjectMarking]
    property :granular_markings, coerce: Array[MetaObject::DataMarking::GranularMarking]
    property :defanged, coerce: ->(value){ Stix2.to_bool(value) }
    property :extensions, coerce: Hash

    def initialize(options = {})
      Hashie.symbolize_keys!(options)
      type = to_dash(self.class.name.split('::').last)
      if options[:type]
        raise("Property 'type' must be '#{type}'") if options[:type] != type
      else
        options[:type] = type
      end
      super(options)
      Stix2::Storage.add(self)
    end

    def method_missing(m, *args, &block)
      if !m.to_s.end_with?('_instance')
        # :nocov:
        super(m, args, block)
        return
        # :nocov:
      end
      # Retrieve the original method
      ref_method = m.to_s.gsub(/_instance$/, '')
      obj = send(ref_method)
      raise("Can't get a Stix2::Identifier from #{ref_method}") if !obj.is_a?(Stix2::Identifier)
      Stix2::Storage.find(obj)
    end

    private

    def to_dash(string)
      string.gsub(/[[:upper:]]/) { "-#{$&.downcase}" }[1..]
    end

    def self.validate_array(list, valid_values)
      excess = (Array(list).map(&:to_s) - valid_values.map(&:to_s))
      excess.empty? || raise("Invalid values: #{excess}")
      list
    end

    def self.hash_dict(hsh)
      validate_array(hsh.keys, HASH_ALGORITHM_OV)
      hsh
    end
  end
end
