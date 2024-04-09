module Stix2
  OPINION_ENUM = [
    "strongly-disagree",
    "disagree",
    "neutral",
    "agree",
    "strongly-agree"
  ].freeze

  ENCRYPTION_ALGORITHM_ENUM = [
    "AES-256-GCM",
    "ChaCha20-Poly1305",
    "mime-type-indicated"
  ].freeze

  WINDOWS_REGISTRY_DATATYPE_ENUM = [
    "REG_NONE",
    "REG_SZ",
    "REG_EXPAND_SZ",
    "REG_BINARY",
    "REG_DWORD",
    "REG_DWORD_BIG_ENDIAN",
    "REG_DWORD_LITTLE_ENDIAN",
    "REG_LINK",
    "REG_MULTI_SZ",
    "REG_RESOURCE_LIST",
    "REG_FULL_RESOURCE_DESCRIPTION",
    "REG_RESOURCE_REQUIREMENTS_LIST",
    "REG_QWORD",
    "REG_INVALID_TYPE"
  ].freeze

  EXTENSION_TYPE_ENUM = [
    "new-sdo",
    "new-sco",
    "new-sro",
    "property-extension",
    "toplevel-property-extension"
  ].freeze

  NETWORK_SOCKET_ADDRESS_FAMILY_ENUM = [
    "AF_UNSPEC",
    "AF_INET",
    "AF_IPX",
    "AF_APPLETALK",
    "AF_NETBIOS",
    "AF_INET6",
    "AF_IRDA",
    "AF_BTH"
  ].freeze

  NETWORK_SOCKET_TYPE_ENUM = [
    "SOCK_STREAM",
    "AF_ISOCK_DGRAMNET",
    "SOCK_RAW",
    "SOCK_RDM",
    "SOCK_SEQPACKET"
  ].freeze

  WINDOWS_INTEGRITY_LEVEL_ENUM = [
    "low",
    "medium",
    "high",
    "system"
  ].freeze

  WINDOWS_SERVICE_START_TYPE_ENUM = [
    "SERVICE_AUTO_START",
    "SERVICE_BOOT_START",
    "SERVICE_DEMAND_START",
    "SERVICE_DISABLED",
    "SERVICE_SYSTEM_ALERT"
  ].freeze

  WINDOWS_SERVICE_TYPE_ENUM = [
    "SERVICE_KERNEL_DRIVER",
    "SERVICE_FILE_SYSTEM_DRIVER",
    "SERVICE_WIN32_OWN_PROCESS",
    "SERVICE_WIN32_SHARE_PROCESS"
  ].freeze

  WINDOWS_SERVICE_STATUS_ENUM = [
    "SERVICE_CONTINUE_PENDING",
    "SERVICE_PAUSE_PENDING",
    "SERVICE_PAUSED",
    "SERVICE_RUNNING",
    "SERVICE_START_PENDING",
    "SERVICE_STOP_PENDING",
    "SERVICE_STOPPED"
  ].freeze
end
