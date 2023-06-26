module Stix2
  SPEC_VERSIONS = ['2.1']

  class Common < Stix2::Base
    property :type, required: true, coerce: String
    property :spec_version, coerce: String, values: Stix2::SPEC_VERSIONS
    property :id, coerce: Identifier
    property :created_by_ref, coerce: Identifier
    property :created, coerce: Time
    property :modified, coerce: Time
    property :revoked, coerce: ->(value){ Stix2.to_bool(value) }
    property :labels, coerce: Array[String]
    property :confidence, coerce: Integer
    property :lang, coerce: String
    property :external_references, coerce: Array[ExternalReference]
    property :object_marking_refs, coerce: Array[Stix2::MetaObject::DataMarking::ObjectMarking]
    property :granular_markings, coerce: Array[MetaObject::DataMarking::GranularMarking]
    property :defanged, coerce: ->(value){ Stix2.to_bool(value) }
    property :extensions, coerce: Hash
    #  ->(hsh) do
    #   hsh.each do |key, value|
    #     key.match?(/^[a-z0-9-]*$/) || raise('Invalid extension name format')
    #     value_ = Hashie.symbolize_keys(value)
    #     case key
    #     when /^extension-definition/
    #       require 'pry'
    #       binding.pry
    #       ExtensionDefinition.new(value)
    #     when 'archive-ext'
    #       Stix2::Extensions::ArchiveFile.new(value)
    #     when 'ntfs-ext'
    #       value_[:alternate_data_streams].is_a?(Array) || raise('alternate_data_streams must be Array')
    #     # when 
    #     end
    #   end
    #   hsh
    # end

    def initialize(options = {})
      Hashie.symbolize_keys!(options)
      type = to_dash(self.class.name.split('::').last)
      if options[:type]
        raise("Property 'type' must be '#{type}'") if options[:type] != type
      else
        options[:type] = type
      end
      process_toplevel_property_extension(options[:extensions])
      super(options)
      process_extensions(options)
      Stix2::Storage.add(self)
    end

    def method_missing(m, *args, &block)
      if !m.to_s.end_with?('_instance')
        # :nocov:
        super(m, args, block)
        return
        # :nocov:
      end
      # Retrieve the original method
      ref_method = m.to_s.gsub(/_instance$/, '')
      obj = send(ref_method)
      raise("Can't get a Stix2::Identifier from #{ref_method}") if !obj.is_a?(Stix2::Identifier)
      Stix2::Storage.find(obj)
    end

    private

    def to_dash(string)
      string.gsub(/[[:upper:]]/) { "-#{$&.downcase}" }[1..]
    end

    def self.validate_array(list, valid_values)
      excess = (Array(list).map(&:to_s) - valid_values.map(&:to_s))
      excess.empty? || raise("Invalid values: #{excess}")
      list
    end

    def self.hash_dict(hsh)
      validate_array(hsh.keys, HASH_ALGORITHM_OV)
      hsh
    end

    def process_toplevel_property_extension(extensions)
      extension_definition = extensions&.find{ |key, val| key.to_s.start_with?('extension-definition') }
      return if !extension_definition

      id = extension_definition.first
      type = extension_definition.last[:extension_type]
      if type == 'toplevel-property-extension'
        Stix2::Storage.active? || raise('Stix.storage must be active to use toplevel-property-extension')
        ext = Stix2::Storage.find(id)
        ext.extension_properties.each do |prop|
          self.class.class_eval do
            property prop
          end
        end
      end
    end

    def process_extensions(options)
      options[:extensions]&.each do |id, value|
        case id.to_s
        when /[A-Z]/
          raise('Invalid extension name format.')
        when 'archive-ext'
          extensions[id] = Stix2::Extensions::ArchiveFile.new(value)
        when /^extension-definition/
          # Ignore it, already processes
        when 'socket-ext'
          extensions[id] = Stix2::Extensions::Socket.new(value)
        when 'icmp-ext'
          extensions[id] = Stix2::Extensions::Icmp.new(value)
        when 'http-request-ext'
          extensions[id] = Stix2::Extensions::HttpRequest.new(value)
        when 'ntfs-ext'
          extensions[id] = Stix2::Extensions::Ntfs.new(value)
        when 'tcp-ext'
          extensions[id] = Stix2::Extensions::Tcp.new(value)
        when 'windows-process-ext'
          extensions[id] = Stix2::Extensions::WindowsProcess.new(value)
        when 'windows-service-ext'
          extensions[id] = Stix2::Extensions::WindowsService.new(value)
        when 'unix-account-ext'
          extensions[id] = Stix2::Extensions::UnixAccount.new(value)
        when 'pdf-ext'
          extensions[id] = Stix2::Extensions::Pdf.new(value)
        when 'raster-image-ext'
          extensions[id] = Stix2::Extensions::RasterImage.new(value)
        when 'windows-pebinary-ext'
          extensions[id] = Stix2::Extensions::WindowsPebinary.new(value)
        else
          # Ensure we have a hash
          value.is_a?(Hash) || raise("Custom extension must be Hash: #{value}")
        end
      end
    end
  end
end
