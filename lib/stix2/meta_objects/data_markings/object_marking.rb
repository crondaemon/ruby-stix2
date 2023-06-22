module Stix2
  module MetaObject
    module DataMarking
      class ObjectMarking < String
        def initialize(value)
          value.match(/marking-definition--.*/) || raise("Invalid value: #{value}")
          super(value)
        end
      end
    end
  end
end