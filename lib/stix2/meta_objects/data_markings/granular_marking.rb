module Stix2
  module MetaObject
    module DataMarking
      class GranularMarking < Hashie::Dash
        include Hashie::Extensions::Dash::PredefinedValues
        include Hashie::Extensions::IndifferentAccess
        include Hashie::Extensions::Dash::Coercion

        property :lang, coerce: String
        property :marking_ref, coerce: Identifier
        property :selectors, coerce: Array[String]
      end
    end
  end
end
