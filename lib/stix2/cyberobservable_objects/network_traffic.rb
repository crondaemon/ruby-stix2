module Stix2
  module CyberobservableObject
    class NetworkTraffic < Base
      property :start, coerce: Time
      property :end, coerce: Time
      property :is_active, coerce: ->(v){ Stix2.to_bool(v) }
      property :src_ref, coerce: Identifier
      property :dst_ref, coerce: Identifier
      property :src_port, coerce: Integer
      property :dst_port, coerce: Integer
      property :protocols, required: true, coerce: Array[String]
      property :src_byte_count, coerce: Integer
      property :dst_byte_count, coerce: Integer
      property :src_packets, coerce: Integer
      property :dst_packets, coerce: Integer
      property :ipfix, coerce: Hash
      property :src_payload_ref, coerce: Identifier
      property :dst_payload_ref, coerce: Identifier
      property :encapsulates_refs, coerce: Array[Identifier]
      property :encapsulated_by_ref, coerce: Identifier
    end
  end
end
