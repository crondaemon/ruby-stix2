require "ipaddr"

module Stix2
  module CyberobservableObject
    class Ipv6Addr < Base
      property :value, required: true, coerce: String
      property :resolves_to_refs, coerce: [Identifier]
      property :resolves_to_refs, coerce: [Identifier]

      def initialize(args = {})
        super
        validate_ipv6! if @strict
      end

      private

      def validate_ipv6!
        IPAddr.new(value, Socket::AF_INET6)
      end
    end
  end
end
