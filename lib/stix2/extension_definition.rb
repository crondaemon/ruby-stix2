module Stix2
  class ExtensionDefinition < Stix2::Common
    property :name, required: true, coerce: String
    property :description, coerce: String
    property :schema, required: true, coerce: String
    property :version, required: true, coerce: String
    property :extension_types, required: true, coerce: ->(values){ validate_array(values, EXTENSION_TYPE_ENUM) }
    property :extension_properties, coerce: Array[String]

    def initialize(options)
      options_ = Hashie.symbolize_keys(options)
      # The extension type 'toplevel-property-extension' creates new property in the root object
      if options[:extension_types].map(&:to_s).include?('toplevel-property-extension')
        Stix2::Common.class_eval do
          options_[:extension_properties].each do |extension_property|
            property extension_property
          end
        end
      end
      super(options)
    end
  end
end
