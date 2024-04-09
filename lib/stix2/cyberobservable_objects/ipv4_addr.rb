require "ipaddr"

module Stix2
  module CyberobservableObject
    class Ipv4Addr < Base
      property :value, required: true, coerce: ->(v) { IPAddr.new(v, Socket::AF_INET).to_s }
      property :resolves_to_refs, coerce: [Identifier]
      property :resolves_to_refs, coerce: [Identifier]
    end
  end
end
