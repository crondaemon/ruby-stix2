module Stix2
  module CyberobservableObject
    class File < Base
      property :hashes, coerce: ->(hsh){ hash_dict(hsh) }
      property :size, coerce: Integer
      property :name, coerce: String
      property :name_enc, coerce: String
      property :magic_number_hex, coerce: String
      property :mime_type, coerce: String
      property :ctime, coerce: String
      property :mtime, coerce: String
      property :atime, coerce: String
      property :parent_directory_ref, coerce: Identifier
      property :contains_refs, coerce: Array[Identifier]
      property :content_ref, coerce: Identifier
    end
  end
end
