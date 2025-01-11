require "test_helper"

class ObjectMarkingTest < Stix2::Test
  def test_object_marking
    obj = Stix2::MetaObject::DataMarking::ObjectMarking.new(stix_messages(:object_marking))
    assert obj
    assert "marking-definition--34098fce-860f-48ae-8e50-ebd3cc5e41da", obj.to_s
  end

  def test_marking_definition
    data = stix_messages(:marking_definition2)
    exception = assert_raises(Stix2::Exception::PropertyDefinitionMatching) do
      Stix2::MetaObject::DataMarking::MarkingDefinition.new(data)
    end
    assert_equal "Property 'definition_type' and 'definition' must have a matching key", exception.message
  end

  def test_bad_object_marking
    exception = assert_raises(Stix2::Exception::InvalidValues) do
      Stix2::MetaObject::DataMarking::ObjectMarking.new("bad")
    end
    assert_equal "Invalid value: bad", exception.message
  end
end
