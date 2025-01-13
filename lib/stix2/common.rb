require "securerandom"

module Stix2
  SPEC_VERSIONS = ["2.1"]
  UUID_NAMESPACE = "00abedb4-aa42-466c-9c01-fed23315a9b7"

  class Common < Stix2::Base
    include Hashie::Extensions::Dash::PropertyTranslation
    property :type, required: true, coerce: String
    property :spec_version, coerce: String, values: Stix2::SPEC_VERSIONS, default: SPEC_VERSIONS.last
    property :id, coerce: Identifier, required: true
    property :created_by_ref, coerce: Identifier
    property :created, coerce: Time
    property :modified, coerce: Time
    property :revoked, coerce: Stix2.bool
    property :labels, coerce: [String]
    property :confidence, coerce: Integer
    property :lang, coerce: String
    property :external_references, coerce: [ExternalReference]
    property :object_marking_refs, coerce: [Stix2::MetaObject::DataMarking::ObjectMarking]
    property :granular_markings, coerce: [MetaObject::DataMarking::GranularMarking]
    property :defanged, coerce: Stix2.bool
    property :extensions, coerce: Hash

    def initialize(options = {})
      options_ = options.dup
      Hashie.symbolize_keys!(options_)
      guess_type(options_)
      autogenerate_id(options_)
      process_toplevel_property_extension(options[:extensions])
      super(options_)
      process_extensions(options_)
      validate_confidence!
      Stix2::Storage.add(self)
    end

    def method_missing(m, *args, &block)
      if !m.to_s.end_with?("_instance")
        # :nocov:
        super(m, args, block)
        return
        # :nocov:
      end
      # Retrieve the original method
      ref_method = m.to_s.gsub(/_instance$/, "")
      obj_id = public_send(ref_method)
      Stix2::Storage.find(obj_id)
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?("_instance") || super
    end

    def confidence_scale
      Stix2::ConfidenceScale.new(confidence)
    end

    private

    def guess_type(options)
      type = to_dash(self.class.name.split("::").last)
      if options[:type]
        if !options[:type].start_with?("x-") && options[:type] != type
          raise(Exception::BadType.new(type))
        end
      else
        options[:type] = type
      end
    end

    def validate_confidence!
      return if !confidence
      valid_range = (0..100)
      valid_range.include?(confidence) || raise(Exception::InvalidRange.new(valid_range, confidence))
    end

    def autogenerate_id(options)
      options[:id] ||= "#{options[:type]}--#{SecureRandom.uuid}"
    end

    def to_dash(string)
      string.gsub(/[[:upper:]]/) { "-#{$&.downcase}" }[1..]
    end

    def process_toplevel_property_extension(extensions)
      extension_definition = extensions&.find { |key, val| key.to_s.start_with?("extension-definition") }
      return if !extension_definition

      id = extension_definition.first
      type = extension_definition.last[:extension_type]
      if type == "toplevel-property-extension"
        Stix2::Storage.active? || raise(Exception::StorageInactive.new)
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
          raise(Exception::InvalidExtensionNameFormat.new(id))
        when "archive-ext"
          extensions[id] = Stix2::Extensions::ArchiveFile.new(value)
        when /^extension-definition/
          # Ignore it, already processes
        when "socket-ext"
          extensions[id] = Stix2::Extensions::Socket.new(value)
        when "icmp-ext"
          extensions[id] = Stix2::Extensions::Icmp.new(value)
        when "http-request-ext"
          extensions[id] = Stix2::Extensions::HttpRequest.new(value)
        when "ntfs-ext"
          extensions[id] = Stix2::Extensions::Ntfs.new(value)
        when "tcp-ext"
          extensions[id] = Stix2::Extensions::Tcp.new(value)
        when "windows-process-ext"
          extensions[id] = Stix2::Extensions::WindowsProcess.new(value)
        when "windows-service-ext"
          extensions[id] = Stix2::Extensions::WindowsService.new(value)
        when "unix-account-ext"
          extensions[id] = Stix2::Extensions::UnixAccount.new(value)
        when "pdf-ext"
          extensions[id] = Stix2::Extensions::Pdf.new(value)
        when "raster-image-ext"
          extensions[id] = Stix2::Extensions::RasterImage.new(value)
        when "windows-pebinary-ext"
          extensions[id] = Stix2::Extensions::WindowsPebinary.new(value)
        else
          # Ensure we have a hash
          value.is_a?(Hash) || raise(Exception::CustomExtensionFormat.new(value))
        end
      end
    end
  end
end
