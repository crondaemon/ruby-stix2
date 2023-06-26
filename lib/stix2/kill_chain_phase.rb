module Stix2
  class KillChainPhase < Stix2::Base
    property :kill_chain_name, required: true, coerce: String
    property :phase_name, required: true, coerce: String
  end
end
