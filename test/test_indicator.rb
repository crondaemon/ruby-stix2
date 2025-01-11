require "test_helper"

class IndicatorTest < Stix2::Test
  def test_default_value
    indicator = Stix2::DomainObject::Indicator.new
    assert indicator
    assert_equal "indicator", indicator.type
  end

  def test_boolean
    [true, "true"].each do |value|
      indicator = Stix2::DomainObject::Indicator.new(type: "indicator", revoked: value)
      assert indicator
      assert indicator.revoked
    end
  end

  def test_correct_build
    indicator = Stix2::DomainObject::Indicator.new(
      type: "indicator",
      id: "file--1389b98d-a3d3-5190-a996-716fd444059a",
      description: "description",
      indicator_types: ["anomalous-activity", "anonymization"],
      pattern: "pattern",
      pattern_type: "yara",
      pattern_version: 1,
      valid_from: Time.now,
      valid_until: Time.now,
      kill_chain_phases: [
        {
          kill_chain_name: "lockheed-martin-cyber-kill-chain",
          phase_name: "reconnaissance"
        },
        {
          kill_chain_name: "foo",
          phase_name: "pre-attack"
        }
      ]
    )
    assert indicator
    assert indicator.indicator_types.count > 0
  end

  def test_invalid_values
    exception = assert_raises(Stix2::Exception::InvalidValues) do
      Stix2::DomainObject::Indicator.new(indicator_types: ["invalid1", "invalid2"])
    end
    assert_equal "Invalid values: invalid1, invalid2", exception.message
  end
end
