module Stix2
  module MetaObject
    module DataMarking
      class Base < Hashie::Dash
        include Hashie::Extensions::Dash::PredefinedValues
        include Hashie::Extensions::IndifferentAccess
        include Hashie::Extensions::Dash::Coercion
      end
    end
  end
end
