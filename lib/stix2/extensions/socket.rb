module Stix2
  module Extensions
    class Socket < Stix2::Base
      property :address_family, required: true, values: NETWORK_SOCKET_ADDRESS_FAMILY_ENUM
      property :is_blocking, coerce: ->(value) { Stix2.to_bool(value) }
      property :is_listening, coerce: ->(value) { Stix2.to_bool(value) }
      property :options, coerce: ->(hsh) { hsh.keys.all? { |k| k.is_a?(Integer) } && hsh }
      property :socket_type, values: NETWORK_SOCKET_TYPE_ENUM
      property :socket_descriptor, coerce: Integer
      property :socket_handle, coerce: Integer
    end
  end
end
