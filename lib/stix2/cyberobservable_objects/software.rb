module Stix2
  module CyberobservableObject
    class Software < Base
      property :name, required: true, coerce: String
      property :cpe, coerce: String
      property :swid, coerce: String
      property :languages, coerce: Array[String]
      property :vendor, coerce: String
      property :version, coerce: String
    end
  end
end
