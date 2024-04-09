module Stix2
  module DomainObject
    class Identity < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :roles, coerce: [String]
      property :identity_class, coerce: String, values: IDENTITY_CLASS_OV
      property :sectors, coerce: String, values: INDUSTRY_SECTOR_OV
      property :contact_information, coerce: String
    end
  end
end
