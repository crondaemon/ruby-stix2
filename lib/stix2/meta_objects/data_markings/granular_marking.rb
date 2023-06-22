module Stix2
  module MetaObject
    module DataMarking
      class GranularMarking < Stix2::Base
        property :lang, coerce: String
        property :marking_ref, coerce: Identifier
        property :selectors, coerce: Array[String]
      end
    end
  end
end
