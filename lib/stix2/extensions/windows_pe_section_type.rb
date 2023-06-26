module Stix2
  module Extensions
    class WindowsPeSectionType < Stix2::Base
      property :name, required: true, coerce: String
      property :size, coerce: Integer
      property :entropy, coerce: Float
      property :hashes, coerce: ->(hsh){ hash_dict(hsh) }
    end
  end
end
