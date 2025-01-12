module Stix2
  module Validators
    class Hashes
      def initialize(hsh)
        return if !hsh
        raise(ArgumentError.new("hash argument must be an actual hash. Got: #{hsh.class}")) if !hsh.is_a?(::Hash)
        Stix2::Validators::Array.new(hsh.keys, Stix2::HASH_ALGORITHM_OV)
      end
    end
  end
end
