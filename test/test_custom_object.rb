require "test_helper"

class CustomObjectTest < Stix2::Test
  def test_custom_object
    assert Stix2::CustomObject.new(stix_messages("custom_object"))
    assert Stix2.parse(stix_messages("custom_object"))
    assert_raises { Stix2::CustomObject.new(type: "pippo") }
    exception = assert_raises(Stix2::Exception::CustomObjectCreationError) {
      Stix2::CustomObject.new(:type => "x-type", :p1 => "p1", :PR2 => "PR2", ("pr3" * 200) => "pr3")
    }
    expected = "Error creating CustomObject:\n" \
      "Too short: [:p1]\n" \
      "Invalid name: [:PR2]\n" \
      "Too long: [:#{"pr3" * 200}]"

    assert_equal expected, exception.message
  end

  def test_bad_custom_object
    exception = assert_raises(Stix2::Exception::CustomObjectPropertyCount) { Stix2::CustomObject.new(type: "new") }
    assert_equal "A CustomObject must have at least one property", exception.message
  end
end
