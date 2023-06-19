module Stix2
  module DomainObject
    class CourseOfAction < Base
      property :name, coerce: String
      property :description, coerce: String
      property :action
    end
  end
end
