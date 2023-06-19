module Stix2
  module CyberobservableObject
    class WindowsRegistryValue < Base
      property :name, coerce: String
      property :data, coerce: String
      property :data_type, values: WINDOWS_REGISTRY_DATATYPE_ENUM
    end
  end
end
