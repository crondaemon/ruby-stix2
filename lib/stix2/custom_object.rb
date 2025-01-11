module Stix2
  class CustomObject < Stix2::Common
    include Hashie::Extensions::IgnoreUndeclared

    property :id, coerce: Identifier

    def initialize(options)
      Hashie.symbolize_keys!(options)
      raise(Exception::CustomObjectPropertyCount.new) if options[:type] && options.count == 1
      errors = Hash.new { |k, v| k[v] = [] }
      options.each do |key, value|
        errors["Too short"] << key if key != :id && key.size < 3
        errors["Invalid name"] << key if !key.match?(/^[a-z0-9_]*$/)
        errors["Too long"] << key if key.size > 250
      end
      raise(Exception::CustomObjectCreationError.new(errors)) if !errors.empty?
      super(options)
    end
  end
end
