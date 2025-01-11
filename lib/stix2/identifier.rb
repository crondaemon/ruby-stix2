module Stix2
  class Identifier < String
    def initialize(value)
      value.match(/.*--.*/) || raise(Exception::InvalidIdentifier.new(value))
      super(value)
    end
  end
end
