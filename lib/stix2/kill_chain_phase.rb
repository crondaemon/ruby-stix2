module Stix2
  class KillChainPhase < Hashie::Dash
    include Hashie::Extensions::Dash::PredefinedValues
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::Dash::Coercion
    
    property :kill_chain_name, coerce: String
    property :phase_name, coerce: String
  end
end
