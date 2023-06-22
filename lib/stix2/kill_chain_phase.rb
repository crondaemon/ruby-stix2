module Stix2
  class KillChainPhase < Stix2::Base
    property :kill_chain_name, coerce: String
    property :phase_name, coerce: String
  end
end
