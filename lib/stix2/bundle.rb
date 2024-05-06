module Stix2
  class Bundle < Stix2::Common
    property :type, required: true, coerce: String
    property :objects, coerce: ->(array) { array.all? { |element| element.is_a?(::Stix2::Common) || raise("Invalid Object") } && array }
  end
end
