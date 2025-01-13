require "test_helper"

class RelationshipTest < Stix2::Test
  def test_create_relationships
    types = ["indicates", "indicates", "foo", "targets"]
    messages = stix_messages("relationship")
    messages.each_with_index do |message, idx|
      relationship = Stix2.parse(message)
      assert relationship
      assert_equal types[idx], relationship.relationship_type
    end
  end

  def test_not_create_relationships
    stix_messages("relationship_error").each do |message|
      exception = assert_raises(ArgumentError) { Stix2.parse(message) }
      assert_match(/The property .* is required for Stix2::.*/, exception.message)
    end
  end

  def test_invalid_relationship_type
    exception = assert_raises(Stix2::Exception::InvalidValues) do
      Stix2::RelationshipObject::Relationship.new(
        relationship_type: "BAD",
        source_ref: "indicator--1",
        target_ref: "indicator--2"
      )
    end
    assert_equal "Invalid value: BAD", exception.message
  end
end
