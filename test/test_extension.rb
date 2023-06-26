require 'test_helper'

class ExtensionTest < Stix2::Test
  def test_top_level
    Stix2::Storage.activate
    extension_definition = Stix2::ExtensionDefinition.new(
      "id": "extension-definition--71736db5-10db-43d3-b0e3-65cf81601fe1",
      "type": "extension-definition",
      "spec_version": "2.1",
      "name": "Extension Foo 1a",
      "description": "This schema adds two properties to a STIX object at the toplevel",
      "created": "2014-02-20T09:16:08.989000Z",
      "modified": "2014-02-20T09:16:08.989000Z",
      "created_by_ref": "identity--11b76a96-5d2b-45e0-8a5a-f6994f370731",
      "schema": "https://www.example.com/schema-foo-1a/v1/",
      "version": "1.2.1",
      "extension_types": ["toplevel-property-extension"],
      "extension_properties": [
        "toxicity", # This is a new property
        "rank" # This is a new property
      ]
    )
    assert extension_definition

    indicator = Stix2::DomainObject::Indicator.new(
      "type": "indicator",
      "spec_version": "2.1",
      "id": "indicator--66a63e16-92d7-4b2f-bd3d-21540d6b3fc7",
      "created": "2014-02-20T09:16:08.989000Z",
      "modified": "2014-02-20T09:16:08.989000Z",
      "name": "File hash for Poison Ivy variant",
      "description": "This file hash indicates that a sample of Poison Ivy is present.",
      "labels": [
        "malicious-activity"
      ],
      "pattern": "[file:hashes.'SHA-256' = 'ef537f25c895bfa782526529a9b63d97aa631564d5d789c2b765448c8635fb6c']",
      "pattern_type": "stix",
      "valid_from": "2014-02-20T09:00:00.000000Z",
      "rank": 1, # This is a new property, defined by the previous extension
      "toxicity": 2, # This is a new property, defined by the previous extension
      "extensions": {
        "extension-definition--71736db5-10db-43d3-b0e3-65cf81601fe1": {
          "extension_type": "toplevel-property-extension"
        }
      }
    )
    Stix2::Storage.deactivate
  end

  def test_invalid_name
    assert_raises(RuntimeError, 'Invalid extension name format') do
      Stix2::DomainObject::Indicator.new(
        "type": "indicator",
        "extensions": { "x-EXAMPLE-com-foo": { "bar_val": "bar" } }
      )
    end
  end

  def test_file_extensions
    Dir['test/fixtures/extension*.json'].each do |filename|
      json = JSON.parse(File.read(filename))
      assert Stix2.parse(json)
    end
  end
end
