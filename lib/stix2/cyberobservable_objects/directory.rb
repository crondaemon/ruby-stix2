module Stix2
  module CyberobservableObject
    class Directory < Base
      property :path, required: true, coerce: String
      property :path, required: true, coerce: String
      property :ctime, coerce: Time
      property :mtime, coerce: Time
      property :atime, coerce: Time
      property :contains_refs, coerce: [Identifier]
    end
  end
end
