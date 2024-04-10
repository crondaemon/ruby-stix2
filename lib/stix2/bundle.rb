module Stix2
  class Bundle < Stix2::Common
    property :type, required: true, coerce: String
    property :objects, coerce: ->(values) { values.map { Stix2.parse(_1) } }
  end
end
