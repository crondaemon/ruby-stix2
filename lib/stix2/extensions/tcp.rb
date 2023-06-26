module Stix2
  module Extensions
    class Tcp < Stix2::Base
      property :src_flags_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
      property :dst_flags_hex, coerce: ->(value) { Stix2.is_hex?(value) && value }
    end
  end
end
