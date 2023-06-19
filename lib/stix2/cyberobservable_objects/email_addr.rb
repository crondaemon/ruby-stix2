module Stix2
  module CyberobservableObject
    class EmailAddr < Base
      property :value, required: true, coerce: String
      property :display_name, coerce: String
      property :belongs_to_ref, coerce: Identifier
    end
  end
end
