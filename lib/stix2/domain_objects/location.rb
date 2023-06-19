module Stix2
  module DomainObject
    class Location < Base
      property :name, coerce: String
      property :description, coerce: String
      property :latitude, coerce: Float
      property :longitude, coerce: Float
      property :precision, coerce: Float
      property :region, values: REGION_OV
      property :country, coerce: String
      property :administrative_area, coerce: String
      property :city, coerce: String
      property :street_address, coerce: String
      property :postal_code, coerce: String
    end
  end
end
