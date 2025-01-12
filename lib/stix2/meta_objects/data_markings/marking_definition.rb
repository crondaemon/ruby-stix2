module Stix2
  module MetaObject
    module DataMarking
      class MarkingDefinition < Stix2::Common
        property :name, coerce: String
        property :definition_type, required: true, coerce: String
        property :definition, required: true, coerce: {String => String}

        def initialize(args = {})
          super
          validate_definitions!
        end

        private

        def validate_definitions!
          raise(Exception::PropertyDefinitionSize.new(definition.size)) if definition.size > 1
          if definition_type != definition.keys.first
            raise(Exception::PropertyDefinitionMatching.new)
          end
        end
      end
    end
  end
end
