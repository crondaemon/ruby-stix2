module Stix2
  module MetaObject
    module DataMarking
      class ObjectMarking
        def initialize(value)
          value.match(/marking-definition--.*/) || raise("Invalid value: #{value}")
          @value = value
        end

        def to_s
          @value
        end

        def pretty_print(pp)
          # :nocov:
          pp.text(@value.inspect)
          # :nocov
        end
      end
    end
  end
end