require 'test_helper'

class BundleTest < Stix2::Test
  def test_bundle
    bundle = stix_messages('bundle')
    assert Stix2::Bundle.new(bundle)
  end

  def test_cross_reference
    bundle = Stix2::Bundle.new(stix_messages('bundle2'))
    assert_equal 5, bundle.objects.count
    bundle.objects.each do |object|
      assert object.is_a?(Stix2::Common)
    end
  end
end
