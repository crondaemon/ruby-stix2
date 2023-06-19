module Stix2
  class Boolean
    def initialize(value)
      case value
      when String
        @value = !!(value =~ /\A(true|t|yes|y|1)\z/i)
      when Numeric
        @value = !value.to_i.zero?
      else
        @value = (value == true)
      end
    end

    def method_missing(m, *args, &block)
      @value.send(m, *args, &block)
    end
  end
end
