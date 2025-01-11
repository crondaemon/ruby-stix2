require "test_helper"

class Stix2Test < Stix2::Test
  class Fake
    def to_s
      '{"type":"indicator"}'
    end
  end

  def test_objects
    [:"attack-pattern", :campaign, :"course-of-action", :grouping, :identity, :indicator, :infrastructure,
      :"intrusion-set", :location, :malware, :malware_analysis, :note, :"observed-data", :opinion, :report,
      :"threat-actor", :tool, :vulnerability, :relationship, :sighting, :artifact, :autonomous_system, :directory,
      :domain_name, :email_addr, :email_message, :email_mime_part_type, :file, :ipv4_addr, :ipv6_addr, :mac_addr,
      :mutex, :network_traffic, :software, :url, :user_account, :windows_registry_key, :x509_certificate,
      :language_content, :marking_definition].each do |name|
      stix_messages(name).each do |message|
        assert Stix2.parse(message)
      end
    end
  end

  def test_missing_type
    exception = assert_raises(Stix2::Exception::PropertyMissing) { Stix2.parse({}) }
    assert_equal "Property 'type' is missing", exception.message
  end

  def test_wrong_type
    exception = assert_raises(Stix2::Exception::MessageUnsupported) { Stix2.parse(type: "pippo") }
    assert_equal "Message unsupported: 'pippo'", exception.message

    exception = assert_raises(Stix2::Exception::BadType) { Stix2::DomainObject::Indicator.new(type: "pippo") }
    assert_equal "Property 'type' must be 'indicator'", exception.message
  end

  def test_init
    assert Stix2.parse("type" => "indicator")
    assert Stix2.parse('{"type":"indicator"}')
    assert Stix2.parse(Fake.new)
  end

  def test_storage
    Stix2::Storage.activate
    ta = Stix2.parse(stix_messages("threat-actor").first)
    identity = Stix2.parse(stix_messages("identity").first)

    assert_equal identity, ta.created_by_ref_instance
    assert Stix2::Storage.inspect
    Stix2::Storage.deactivate
  end

  def test_auto_uuid
    indicator = Stix2::DomainObject::Indicator.new
    assert indicator.id
  end
end
