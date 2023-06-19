module Stix2
  module CyberobservableObject
    class WindowsRegistryKey < Base
      property :key, coerce: String
      property :values, coerce: [WindowsRegistryValue]
      property :modified_time, coerce: Time
      property :creator_user_ref, coerce: Identifier
      property :number_of_subkeys, coerce: Integer
    end
  end
end
