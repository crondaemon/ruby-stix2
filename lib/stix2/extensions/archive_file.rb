module Stix2
  module Extensions
    class ArchiveFile < Stix2::Base
      property :contains_refs, required: true, coerce: Array[Identifier]
      property :comment, coerce: String
    end
  end
end