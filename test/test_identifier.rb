require "test_helper"

class IdentifierTest < Stix2::Test
  def test_invalid_identifier
    exception = assert_raises(Stix2::Exception::InvalidIdentifier) { Stix2::Identifier.new("invalid") }
    assert_equal "Invalid identifier: invalid", exception.message
  end
end
