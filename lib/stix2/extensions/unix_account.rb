module Stix2
  module Extensions
    class UnixAccount < Stix2::Base
      property :gid, coerce: Integer
      property :groups, coerce: [String]
      property :home_dir, coerce: String
      property :shell, coerce: String
    end
  end
end
