module Stix2
  class Bundle < Stix2::Common
    property :type, required: true, coerce: String
    property :objects, coerce: ->(array) do
      array.all? do |element|
        element.is_a?(::Stix2::Common) || Stix2.parse(element).is_a?(::Stix2::Common) || raise("Invalid Object")
      end && array
    end
  end
end
