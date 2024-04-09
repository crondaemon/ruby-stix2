module Stix2
  module MetaObject
    module DataMarking
      class MarkingDefinition < Stix2::Common
        property :name, coerce: String
        property :definition_type, required: true, coerce: String
        property :definition, required: true, coerce: {String => String}

        def initialize(args)
          super(args)
          raise("Property 'definition' must contain a single key") if definition.size > 1
          if definition_type != definition.keys.first
            raise("Property 'definition_type' and 'definition' must have a matching key")
          end
        end
      end
    end
  end
end
