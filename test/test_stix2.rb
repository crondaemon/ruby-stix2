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
      assert_raises { Stix2::DomainObject::Indicator.new(type: "pippo") }
    end
  end

  def test_object_marking
    obj = Stix2::MetaObject::DataMarking::ObjectMarking.new(stix_messages(:object_marking))
    assert obj
    assert "marking-definition--34098fce-860f-48ae-8e50-ebd3cc5e41da", obj.to_s
  end

  def test_marking_definition
    data = stix_messages(:marking_definition2)
    assert_raises(RuntimeError, "Property 'definition_type' and 'definition' must have a matching key") do
      Stix2::MetaObject::DataMarking::MarkingDefinition.new(data)
    end
  end

  def test_init
    assert Stix2.parse("type" => "indicator")
    assert Stix2.parse('{"type":"indicator"}')
    assert Stix2.parse(Fake.new)
  end

  def test_unsupported
    assert_raises { Stix2.parse(type: "unsupported") }
  end

  def test_storage
    Stix2::Storage.activate
    ta = Stix2.parse(stix_messages("threat-actor").first)
    identity = Stix2.parse(stix_messages("identity").first)

    assert_equal identity, ta.created_by_ref_instance
    assert Stix2::Storage.inspect
    Stix2::Storage.deactivate
  end

  def test_custom_object
    assert Stix2::CustomObject.new(stix_messages("custom_object"))
    assert Stix2.parse(stix_messages("custom_object"))
    assert_raises { Stix2::CustomObject.new(type: "pippo") }
    errors = assert_raises(RuntimeError) {
      Stix2::CustomObject.new(:type => "x-type", :p1 => "p1", :PR2 => "PR2", ("pr3" * 200) => "pr3")
    }
    message = errors.message.match("{(.*)}")[0]
    error_hash = eval(message)
    assert ["Too short", "Invalid name", "Too long"], error_hash.keys
  end

  def test_auto_uuid
    indicator = Stix2::DomainObject::Indicator.new
    assert indicator.id
  end
end
