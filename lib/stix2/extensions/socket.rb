module Stix2
  module Extensions
    class Socket < Stix2::Base
      property :address_family, required: true, values: NETWORK_SOCKET_ADDRESS_FAMILY_ENUM
      property :is_blocking, coerce: Stix2.bool
      property :is_listening, coerce: Stix2.bool
      property :options, coerce: {String => Integer}
      property :socket_type, values: NETWORK_SOCKET_TYPE_ENUM
      property :socket_descriptor, coerce: Integer
      property :socket_handle, coerce: Integer
    end
  end
end
