module Stix2
  module Extensions
    class Icmp < Stix2::Base
      property :icmp_type_hex, required: true, coerce: ->(value){ Stix2.is_hex?(value) && value }
      property :icmp_code_hex, required: true, coerce: ->(value){ Stix2.is_hex?(value) && value }
    end
  end
end
