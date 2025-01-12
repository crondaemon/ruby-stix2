require "ipaddr"

module Stix2
  module CyberobservableObject
    class Ipv4Addr < Base
      property :value, required: true, coerce: String
      property :resolves_to_refs, coerce: [Identifier]
      property :resolves_to_refs, coerce: [Identifier]

      def initialize(args = {})
        super
        validate_ipv4!
      end

      private

      def validate_ipv4!
        IPAddr.new(value, Socket::AF_INET)
      end
    end
  end
end
