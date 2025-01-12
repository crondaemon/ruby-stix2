module Stix2
  class ExtensionDefinition < Stix2::Common
    property :name, required: true, coerce: String
    property :description, coerce: String
    property :schema, required: true, coerce: String
    property :version, required: true, coerce: String
    property :extension_types, required: true, coerce: [String]
    property :extension_properties, coerce: [String]

    def initialize(args = {})
      super
      validate_extension_types!
    end

    private

    def validate_extension_types!
      Stix2::Validators::Array.new(extension_types, Stix2::EXTENSION_TYPE_ENUM)
    end
  end
end
