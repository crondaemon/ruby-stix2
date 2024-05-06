require "test_helper"

class BundleTest < Stix2::Test
  def test_bundle
    json = stix_messages("bundle2")
    id = json["id"]
    objects = json["objects"].map { Stix2.parse(_1) }
    bundle = Stix2::Bundle.new(id: id, objects: objects)
    assert_equal 5, bundle.objects.count
    bundle.objects.each do |object|
      assert object.is_a?(Stix2::Common)
    end
  end
end
