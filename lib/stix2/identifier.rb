module Stix2
  class Identifier < String
    def initialize(value)
      value.match(/.*--.*/) || raise("Invalid identifier: #{value}")
      super(value)
    end
  end
end
