module Stix2
  module Extensions
    class WindowsPeOptionalHeaderType < Stix2::Base
      property :magic_hex, coerce: String
      property :major_linker_version, coerce: Integer
      property :minor_linker_version, coerce: Integer
      property :size_of_code, coerce: Integer
      property :size_of_initialized_data, coerce: Integer
      property :size_of_uninitialized_data, coerce: Integer
      property :address_of_entry_point, coerce: Integer
      property :base_of_code, coerce: Integer
      property :base_of_data, coerce: Integer
      property :image_base, coerce: Integer
      property :section_alignment, coerce: Integer
      property :file_alignment, coerce: Integer
      property :major_os_version, coerce: Integer
      property :minor_os_version, coerce: Integer
      property :major_image_version, coerce: Integer
      property :minor_image_version, coerce: Integer
      property :major_subsystem_version, coerce: Integer
      property :minor_subsystem_version, coerce: Integer
      property :win32_version_value_hex, coerce: String
      property :size_of_image, coerce: Integer
      property :size_of_headers, coerce: Integer
      property :checksum_hex, coerce: String
      property :subsystem_hex, coerce: String
      property :dll_characteristics_hex, coerce: String
      property :size_of_stack_reserve, coerce: Integer
      property :size_of_stack_commit, coerce: Integer
      property :size_of_heap_reserve, coerce: Integer
      property :size_of_heap_commit, coerce: Integer
      property :loader_flags_hex, coerce: String
      property :number_of_rva_and_sizes, coerce: Integer
      property :hashes, coerce: Hash

      def initialize(args = {})
        super
        validate_hashes! if @strict
        validate_magic_hex! if @strict
        validate_win32_version_value_hex! if @strict
        validate_checksum_hex! if @strict
        validate_subsystem_hex! if @strict
        validate_dll_characteristics_hex! if @strict
        validate_loader_flags_hex! if @strict
      end

      private

      def validate_hashes!
        Stix2::Validators::Hashes.new(hashes)
      end

      def validate_magic_hex!
        Stix2::Validators::Hex.new(magic_hex)
      end

      def validate_win32_version_value_hex!
        Stix2::Validators::Hex.new(win32_version_value_hex)
      end

      def validate_checksum_hex!
        Stix2::Validators::Hex.new(checksum_hex)
      end

      def validate_subsystem_hex!
        Stix2::Validators::Hex.new(subsystem_hex)
      end

      def validate_dll_characteristics_hex!
        Stix2::Validators::Hex.new(dll_characteristics_hex)
      end

      def validate_loader_flags_hex!
        Stix2::Validators::Hex.new(loader_flags_hex)
      end
    end
  end
end
