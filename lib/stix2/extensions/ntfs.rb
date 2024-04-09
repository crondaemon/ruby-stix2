require "stix2/extensions/alternate_data_stream_type"

module Stix2
  module Extensions
    class Ntfs < Stix2::Base
      property :sid, coerce: String
      property :alternate_data_streams, coerce: [AlternateDataStreamType]
    end
  end
end
