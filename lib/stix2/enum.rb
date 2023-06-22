module Stix2
  OPINION_ENUM = [
    'strongly-disagree',
    'disagree',
    'neutral',
    'agree',
    'strongly-agree'
  ].freeze

  ENCRYPTION_ALGORITHM_ENUM = [
    'AES-256-GCM',
    'ChaCha20-Poly1305',
    'mime-type-indicated'
  ].freeze

  WINDOWS_REGISTRY_DATATYPE_ENUM = [
    'REG_NONE',
    'REG_SZ',
    'REG_EXPAND_SZ',
    'REG_BINARY',
    'REG_DWORD',
    'REG_DWORD_BIG_ENDIAN',
    'REG_DWORD_LITTLE_ENDIAN',
    'REG_LINK',
    'REG_MULTI_SZ',
    'REG_RESOURCE_LIST',
    'REG_FULL_RESOURCE_DESCRIPTION',
    'REG_RESOURCE_REQUIREMENTS_LIST',
    'REG_QWORD',
    'REG_INVALID_TYPE'
  ].freeze

  EXTENSION_TYPE_ENUM = [
    'new-sdo',
    'new-sco',
    'new-sro',
    'property-extension',
    'toplevel-property-extension'
  ].freeze
end
