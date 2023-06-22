module Stix2
  module MetaObject
    class LanguageContent < Base
      property :object_ref, coerce: Identifier
      property :object_modified, coerce: Time
      property :contents, coerce: ->(hsh) do
        errors = hsh.keys.map(&:to_s) - Stix2::RFC5646_LANGUAGE_TAGS.keys
        raise("Invalid languages: #{errors}") if errors.count > 0
        hsh
      end
    end
  end
end
