module Stix2
  class Base < Hashie::Dash
    include Hashie::Extensions::Dash::PredefinedValues
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::Dash::Coercion
  end
end
