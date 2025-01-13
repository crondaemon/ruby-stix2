require "rubygems"

module Stix2
  class CustomObject < Stix2::Common
    class << self
      extend Gem::Deprecate
      deprecate :new, "Stix2::ExtensionDefinition.new", 2025, 1
    end

    def initialize(attributes = {})
      attributes.each_key do |attribute|
        self.class.property(attribute) unless self.class.property?(attribute)
      end

      super
      h = to_hash
      h.each do |property, value|
        next if property == "id"
        raise(Exception::PropertyInvalidSize.new(property)) if property.size < 3 || property.size > 250
        raise(Exception::PropertyInvalidName.new(property)) if !property.match?(/^[a-z0-9_]*$/)
      end
    end
  end
end
