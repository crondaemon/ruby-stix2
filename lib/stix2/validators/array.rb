module Stix2
  module Validators
    class Array
      def initialize(values, array)
        raise(ArgumentError.new("array argument must be an actual array. Got: #{array.class}")) if !array.is_a?(::Array)
        excess = Array(values).map(&:to_s) - array.map(&:to_s)
        raise(Exception::InvalidValues.new(excess)) if !excess.empty?
      end
    end
  end
end
