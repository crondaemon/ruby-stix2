module Stix2
  module Extensions
    class Pdf < Stix2::Base
      property :version, coerce: String
      property :is_optimized, coerce: ->(value) { Stix2.to_bool(value) }
      property :document_info_dict, Hash[String => String]
      property :pdfid0, coerce: String
      property :pdfid1, coerce: String
    end
  end
end
