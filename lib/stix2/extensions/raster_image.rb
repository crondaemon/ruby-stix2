module Stix2
  module Extensions
    class RasterImage < Stix2::Base
      property :image_height, coerce: Integer
      property :image_width, coerce: Integer
      property :bits_per_pixel, coerce: Integer
      property :exif_tags, coerce: Hash
    end
  end
end
