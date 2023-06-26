require 'hashie'
require 'json'
require 'time'

require 'stix2/version'
require 'stix2/ov'
require 'stix2/enum'
require 'stix2/base'
require 'stix2/languages'
require 'stix2/external_reference'
require 'stix2/identifier'
require 'stix2/kill_chain_phase'

require 'stix2/meta_objects/data_markings/granular_marking'
require 'stix2/meta_objects/data_markings/object_marking'

require 'stix2/common'
require 'stix2/domain_objects/base'
require 'stix2/domain_objects/attack_pattern'
require 'stix2/domain_objects/campaign'
require 'stix2/domain_objects/course_of_action'
require 'stix2/domain_objects/grouping'
require 'stix2/domain_objects/identity'
require 'stix2/domain_objects/indicator'
require 'stix2/domain_objects/infrastructure'
require 'stix2/domain_objects/intrusion-set'
require 'stix2/domain_objects/location'
require 'stix2/domain_objects/malware'
require 'stix2/domain_objects/malware_analysis'
require 'stix2/domain_objects/note'
require 'stix2/domain_objects/observed_data'
require 'stix2/domain_objects/opinion'
require 'stix2/domain_objects/report'
require 'stix2/domain_objects/threat_actor'
require 'stix2/domain_objects/tool'
require 'stix2/domain_objects/vulnerability'

require 'stix2/relationship_objects/base'
require 'stix2/relationship_objects/relationship'
require 'stix2/relationship_objects/sighting'

require 'stix2/cyberobservable_objects/base'
require 'stix2/cyberobservable_objects/artifact'
require 'stix2/cyberobservable_objects/autonomous_system'
require 'stix2/cyberobservable_objects/directory'
require 'stix2/cyberobservable_objects/domain_name'
require 'stix2/cyberobservable_objects/email_addr'
require 'stix2/cyberobservable_objects/email_mime_part_type'
require 'stix2/cyberobservable_objects/email_message'
require 'stix2/cyberobservable_objects/file'
require 'stix2/cyberobservable_objects/ipv4_addr'
require 'stix2/cyberobservable_objects/ipv6_addr'
require 'stix2/cyberobservable_objects/mac_addr'
require 'stix2/cyberobservable_objects/mutex'
require 'stix2/cyberobservable_objects/network_traffic'
require 'stix2/cyberobservable_objects/process'
require 'stix2/cyberobservable_objects/software'
require 'stix2/cyberobservable_objects/url'
require 'stix2/cyberobservable_objects/user_account'
require 'stix2/cyberobservable_objects/windows_registry_value'
require 'stix2/cyberobservable_objects/windows_registry_key'
require 'stix2/cyberobservable_objects/x509_certificate'

require 'stix2/meta_objects/base'
require 'stix2/meta_objects/language_content'

require 'stix2/meta_objects/data_markings/base'
require 'stix2/meta_objects/data_markings/marking_definition'

require 'stix2/extension_definition'
require 'stix2/extensions/archive_file'
require 'stix2/extensions/socket'
require 'stix2/extensions/icmp'
require 'stix2/extensions/http_request'
require 'stix2/extensions/ntfs'
require 'stix2/extensions/tcp'
require 'stix2/extensions/windows_process'
require 'stix2/extensions/windows_service'
require 'stix2/extensions/unix_account'
require 'stix2/extensions/pdf'
require 'stix2/extensions/raster_image'
require 'stix2/extensions/windows_pebinary'

require 'stix2/custom_object'
require 'stix2/bundle'
require 'stix2/confidence_scale'

require 'stix2/storage'

class Time
  class <<self
    alias :coerce :parse
  end
end

module Stix2
  def self.parse(options)
    case options
    when String
      options_ = JSON.parse(options)
    when Hash
      options_ = options.clone
    else
      options_ = JSON.parse(options.to_s)
    end
    Hashie.symbolize_keys!(options_)
    type = options_[:type]
    raise("Property 'type' is missing") if !type
    # Let's try to guess the domain of the object, among the known ones
    [nil, 'DomainObject', 'RelationshipObject', 'CyberobservableObject', 'MetaObject',
      'MetaObject::DataMarking'].each do |family|
      if type.start_with?('x-')
        class_name = 'Stix2::CustomObject'
      else
        class_name = ['Stix2', family, type.split('-').map(&:capitalize).join].compact.join('::')
      end
      return Module.const_get(class_name).new(options_) if Module.const_defined?(class_name)
    end
    raise("Message unsupported: #{type}")
  end

  def self.to_bool(value)
    (value == true) || (value == 'true')
  end

  def self.is_hex?(value)
    value.match?(/^\h*$/)
  end
end
