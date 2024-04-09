require "test_helper"

class ConfidenceTest < Stix2::Test
  def test_confidence
    100.times do |i|
      indicator = Stix2::DomainObject::Indicator.new(confidence: i)
      confidence_scale = indicator.confidence_scale

      assert confidence_scale.to_none_low_med_high.is_a?(String)
      assert confidence_scale.to_none_low_med_high_stix.is_a?(Integer)

      assert confidence_scale.to_0_10.is_a?(Integer)
      assert confidence_scale.to_0_10_stix.is_a?(Integer)

      assert confidence_scale.to_admiralty_credibility.is_a?(Integer)
      assert confidence_scale.to_admiralty_credibility_stix.is_a?(Integer)

      assert confidence_scale.to_wep.is_a?(String)
      assert confidence_scale.to_wep_stix.is_a?(Integer)

      assert confidence_scale.to_dni_scale.is_a?(String)
      assert confidence_scale.to_dni_scale_stix.is_a?(Integer)
    end
  end
end
