module Stix2
  class ExtensionDefinition < Stix2::Common
    property :name, required: true, coerce: String
    property :description, coerce: String
    property :schema, required: true, coerce: String
    property :version, required: true, coerce: String
    property :extension_types, required: true, coerce: ->(values){ validate_array(values, EXTENSION_TYPE_ENUM) }
    property :extension_properties, coerce: Array[String]
  end
end
