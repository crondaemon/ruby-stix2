module Stix2
  module MetaObject
    class LanguageContent < Base
      property :object_ref, coerce: Identifier
      property :object_modified, coerce: Time
      property :contents, coerce: Hash # TODO
    end
  end
end
