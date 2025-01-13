require "test_helper"

class CustomObjectTest < Stix2::Test
  def test_custom_object
    Gem::Deprecate.skip_during do
      assert Stix2::CustomObject.new(stix_messages("custom_object"))
      assert Stix2.parse(stix_messages("custom_object"))
    end
  end

  def test_bad_custom_object
    Gem::Deprecate.skip_during do
      assert_raises(Stix2::Exception::BadType) { Stix2::CustomObject.new(type: "pippo") }

      exception = assert_raises(Stix2::Exception::PropertyInvalidSize) do
        Stix2::CustomObject.new(type: "x-example-com-customobject", p1: "p1")
      end
      assert_equal "Invalid property size for p1. Size must be > 3 and < 250", exception.message

      exception = assert_raises(Stix2::Exception::PropertyInvalidName) do
        Stix2::CustomObject.new(type: "x-example-com-customobject", PROPERTY2: "PROPERTY2")
      end
      assert_equal "Invalid property name: PROPERTY2. Valid chars: a-z, 0-9 and _", exception.message

      exception = assert_raises(Stix2::Exception::PropertyInvalidSize) do
        Stix2::CustomObject.new("type" => "x-example-com-customobject", ("pr3" * 200) => "pr3")
      end
      assert_equal "Invalid property size for #{"pr3" * 200}. Size must be > 3 and < 250", exception.message
    end
  end
end
