module Stix2
  class Identifier
    def initialize(value)
      value.match(/.*--.*/) || raise("Invalid identifier: #{value}")
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
