module Stix2
  module CyberobservableObject
    class File < Base
      property :hashes, coerce: Hash
      property :size, coerce: Integer
      property :name, coerce: String
      property :name_enc, coerce: String
      property :magic_number_hex, coerce: String
      property :mime_type, coerce: String
      property :ctime, coerce: String
      property :mtime, coerce: String
      property :atime, coerce: String
      property :parent_directory_ref, coerce: Identifier
      property :contains_refs, coerce: [Identifier]
      property :content_ref, coerce: Identifier

      def initialize(args = {})
        super
        validate_hashes!
      end

      private

      def validate_hashes!
        Stix2::Validators::Hashes.new(hashes)
      end
    end
  end
end
