module Stix2
  module Extensions
    class AlternateDataStreamType < Stix2::Base
      property :name, required: true, coerce: String
      property :hashes, coerce: ->(hsh){ hash_dict(hsh) }
      property :size, coerce: Integer
    end
  end
end
