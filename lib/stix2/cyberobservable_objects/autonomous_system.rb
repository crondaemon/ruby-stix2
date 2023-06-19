module Stix2
  module CyberobservableObject
    class AutonomousSystem < Base
      property :number, required: true, coerce: Integer
      property :name, coerce: String
      property :rir, coerce: String
    end
  end
end
