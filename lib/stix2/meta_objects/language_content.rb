module Stix2
  module MetaObject
    class LanguageContent < Base
      property :object_ref, coerce: Identifier
      property :object_modified, coerce: Time
      property :contents, coerce: Hash

      def initialize(args = {})
        super
        validate_content! if @strict
      end

      private

      def validate_content!
        Stix2::Validators::Array.new(contents.keys, Stix2::RFC5646_LANGUAGE_TAGS.keys) if contents
      end
    end
  end
end
