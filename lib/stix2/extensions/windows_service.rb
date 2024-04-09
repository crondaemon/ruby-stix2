module Stix2
  module Extensions
    class WindowsService < Stix2::Base
      property :service_name, coerce: String
      property :description, coerce: [String]
      property :display_name, coerce: String
      property :group_name, coerce: String
      property :start_type, values: WINDOWS_SERVICE_START_TYPE_ENUM
      property :service_dll_refs, coerce: [Identifier]
      property :service_type, values: WINDOWS_SERVICE_TYPE_ENUM
      property :service_status, values: WINDOWS_SERVICE_STATUS_ENUM
    end
  end
end
