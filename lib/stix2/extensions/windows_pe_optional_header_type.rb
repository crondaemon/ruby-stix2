module Stix2
  module Extensions
    class WindowsPeOptionalHeaderType < Stix2::Base
      property :magic_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
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
      property :win32_version_value_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :size_of_image, coerce: Integer
      property :size_of_headers, coerce: Integer
      property :checksum_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :subsystem_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :dll_characteristics_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :size_of_stack_reserve, coerce: Integer
      property :size_of_stack_commit, coerce: Integer
      property :size_of_heap_reserve, coerce: Integer
      property :size_of_heap_commit, coerce: Integer
      property :loader_flags_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :number_of_rva_and_sizes, coerce: Integer
      property :hashes, coerce: ->(hsh) { hash_dict(hsh) }
    end
  end
end
