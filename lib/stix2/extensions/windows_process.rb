module Stix2
  module Extensions
    class WindowsProcess < Stix2::Base
      property :aslr_enabled, coerce: Stix2.bool
      property :dep_enabled, coerce: Stix2.bool
      property :priority, coerce: String
      property :owner_sid, coerce: String
      property :window_title, coerce: String
      property :startup_info, coerce: Hash
      property :integrity_level, values: WINDOWS_INTEGRITY_LEVEL_ENUM
    end
  end
end
