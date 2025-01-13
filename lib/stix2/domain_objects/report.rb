module Stix2
  module DomainObject
    class Report < Base
      property :name, required: true, coerce: String
      property :description, coerce: String
      property :report_types, coerce: [String]
      property :published, coerce: Time
      property :object_refs, coerce: [Identifier]

      def initialize(args = {})
        super
        validate_report_types! if @strict
      end

      private

      def validate_report_types!
        Stix2::Validators::Array.new(report_types, Stix2::REPORT_TYPE_OV)
      end
    end
  end
end
