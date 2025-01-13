module Stix2
  module Exception
    class Base < StandardError
    end

    class PropertyMissing < Base
      def initialize(property_name)
        @property_name = property_name
      end

      def message
        "Property '#{@property_name}' is missing"
      end
    end

    class MessageUnsupported < Base
      def initialize(type)
        @type = type
      end

      def message
        "Message unsupported: '#{@type}'"
      end
    end

    class BadType < Base
      def initialize(type)
        @type = type
      end

      def message
        "Property 'type' must be '#{@type}'"
      end
    end

    class InvalidValues < Base
      def initialize(values)
        @values = Array(values)
      end

      def message
        pluralized_value = "value"
        pluralized_value += "s" if @values.size > 1
        "Invalid #{pluralized_value}: #{@values.join(", ")}"
      end
    end

    class StorageInactive < Base
      def message
        "Stix2::Storage must be active to use toplevel-property-extension"
      end
    end

    class InvalidExtensionNameFormat < Base
      def initialize(name)
        @name = name
      end

      def message
        "Invalid extension name format: #{@name}"
      end
    end

    class CustomExtensionFormat < Base
      def initialize(value)
        @value = value
      end

      def message
        "Custom extension value must be Hash. Got: #{@value}"
      end
    end

    class PropertyInvalidName < Base
      def initialize(property_name)
        @property_name = property_name
      end

      def message
        "Invalid property name: #{@property_name}. Valid chars: a-z, 0-9 and _"
      end
    end

    class PropertyInvalidSize < Base
      def initialize(property_name)
        @property_name = property_name
      end

      def message
        "Invalid property size for #{@property_name}. Size must be > 3 and < 250"
      end
    end

    class InvalidIdentifier < Base
      def initialize(value)
        @value = value
      end

      def message
        "Invalid identifier: #{@value}"
      end
    end

    class PropertyDefinitionSize < Base
      def initialize(size)
        @size = size
      end

      def message
        "Property 'definition' must contain a single key. Got #{size} instead"
      end
    end

    class PropertyDefinitionMatching < Base
      def message
        "Property 'definition_type' and 'definition' must have a matching key"
      end
    end

    class InvalidRange < Base
      def initialize(valid_range, value)
        @valid_range = valid_range
        @value = value
      end

      def message
        "Invalid value #{@value} for range #{@valid_range}"
      end
    end
  end
end
