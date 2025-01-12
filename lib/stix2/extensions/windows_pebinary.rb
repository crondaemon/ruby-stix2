require "stix2/extensions/windows_pe_optional_header_type"
require "stix2/extensions/windows_pe_section_type"

module Stix2
  module Extensions
    class WindowsPebinary < Stix2::Base
      property :pe_type, required: true, values: WINDOWS_PEBINARY_TYPE_OV
      property :imphash, coerce: String
      property :machine_hex, coerce: String
      property :number_of_sections, coerce: Integer
      property :time_date_stamp, coerce: Time
      property :pointer_to_symbol_table_hex, coerce: String
      property :number_of_symbols, coerce: Integer
      property :size_of_optional_header, coerce: Integer
      property :characteristics_hex, coerce: String
      property :file_header_hashes, coerce: Hash
      property :optional_header, coerce: WindowsPeOptionalHeaderType
      property :sections, coerce: [WindowsPeSectionType]

      def initialize(args = {})
        super
        validate_file_header_hashes!
        validate_machine_hex!
        validate_pointer_to_symbol_table_hex!
        validate_characteristics_hex!
      end

      private

      def validate_file_header_hashes!
        Stix2::Validators::Hashes.new(file_header_hashes)
      end

      def validate_machine_hex!
        Stix2::Validators::Hex.new(machine_hex)
      end

      def validate_pointer_to_symbol_table_hex!
        Stix2::Validators::Hex.new(pointer_to_symbol_table_hex)
      end

      def validate_characteristics_hex!
        Stix2::Validators::Hex.new(characteristics_hex)
      end
    end
  end
end
