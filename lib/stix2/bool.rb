module Stix2
  def self.bool
    ->(value) { (value == true) || (value == "true") }
  end
end
