module Stix2
  module Extensions
    class Pdf < Stix2::Base
      property :version, coerce: String
      property :is_optimized, coerce: Stix2.bool
      property :document_info_dict, {String => String}
      property :pdfid0, coerce: String
      property :pdfid1, coerce: String
    end
  end
end
