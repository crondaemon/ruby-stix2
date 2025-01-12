module Stix2
  class ExternalReference < Stix2::Base
    property :source_name, coerce: String, required: true
    property :description, coerce: String
    property :url, coerce: String
    property :hashes, coerce: Hash
    property :external_id, coerce: String

    def initialize(args = {})
      super
      validate_hashes!
    end

    private

    def validate_hashes!
      Stix2::Validators::Hashes.new(hashes)
    end
  end
end
