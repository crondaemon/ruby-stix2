require "stix2/extensions/windows_pe_optional_header_type"
require "stix2/extensions/windows_pe_section_type"

module Stix2
  module Extensions
    class WindowsPebinary < Stix2::Base
      property :pe_type, required: true, values: WINDOWS_PEBINARY_TYPE_OV
      property :imphash, coerce: String
      property :machine_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :number_of_sections, coerce: Integer
      property :time_date_stamp, coerce: Time
      property :pointer_to_symbol_table_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :number_of_symbols, coerce: Integer
      property :size_of_optional_header, coerce: Integer
      property :characteristics_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :file_header_hashes, coerce: ->(hsh) { hash_dict(hsh) }
      property :optional_header, coerce: WindowsPeOptionalHeaderType
      property :sections, coerce: [WindowsPeSectionType]
    end
  end
end
