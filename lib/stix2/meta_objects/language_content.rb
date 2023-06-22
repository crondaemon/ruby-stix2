module Stix2
  module MetaObject
    class LanguageContent < Base
      property :object_ref, coerce: Identifier
      property :object_modified, coerce: Time
      property :contents, coerce: ->(hsh){ validate_array(hsh.keys, Stix2::RFC5646_LANGUAGE_TAGS.keys) && hsh }
    end
  end
end
