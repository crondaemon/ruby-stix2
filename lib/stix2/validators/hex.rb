module Stix2
  module Validators
    class Hex
      def initialize(value)
        return if !value
        value.match?(/^\h*$/) || raise(Exception::InvalidValues.new(value))
      end
    end
  end
end
