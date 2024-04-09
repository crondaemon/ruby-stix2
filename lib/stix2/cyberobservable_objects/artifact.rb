module Stix2
  module CyberobservableObject
    class Artifact < Base
      property :mime_type, coerce: String
      property :payload_bin, coerce: String
      property :url, coerce: String
      property :hashes, coerce: ->(hsh) { hash_dict(hsh) }
      property :encryption_algorithm, values: ENCRYPTION_ALGORITHM_ENUM
      property :decryption_key, coerce: String
    end
  end
end
