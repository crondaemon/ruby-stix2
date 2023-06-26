module Stix2
  INDICATOR_TYPE_OV = [
    'anomalous-activity',
    'anonymization',
    'benign',
    'compromised',
    'malicious-activity',
    'attribution',
    'unknown'
  ].freeze

  PATTERN_TYPE_OV = [
    'stix',
    'pcre',
    'sigma',
    'snort',
    'suricata',
    'yara'
  ].freeze

  GROUPING_CONTEXT_OV = [
    'suspicious-activity',
    'malware-analysis',
    'unspecified'
  ].freeze

  IDENTITY_CLASS_OV = [
    'individual',
    'group',
    'system',
    'organization',
    'class',
    'unspecified'
  ].freeze

  INDUSTRY_SECTOR_OV = [
    'agriculture',
    'aerospace',
    'automotive',
    'chemical',
    'commercial',
    'communications',
    'construction',
    'defense',
    'education',
    'energy',
    'entertainment',
    'financial-services',
    'government (emergency-services, government-local, government-national, government-public-services, government-regional)',
    'healthcare',
    'hospitality-leisure',
    'infrastructure (dams, nuclear, water)',
    'insurance',
    'manufacturing',
    'mining',
    'non-profit',
    'pharmaceuticals',
    'retail',
    'technology',
    'telecommunications',
    'transportation',
    'utilities'
  ].freeze

  MALWARE_TYPE_OV = [
    'adware',
    'backdoor',
    'bot',
    'bootkit',
    'ddos',
    'downloader',
    'dropper',
    'exploit-kit',
    'keylogger',
    'ransomware',
    'remote-access-trojan',
    'resource-exploitation',
    'rogue-security-software',
    'rootkit',
    'screen-capture',
    'spyware',
    'trojan',
    'unknown',
    'virus',
    'webshell',
    'wiper',
    'worm'
  ].freeze

  PROCESSOR_ARCHITECTURE_OV = [
    'alpha',
    'arm',
    'ia-64',
    'mips',
    'powerpc',
    'sparc',
    'x86',
    'x86-64'
  ].freeze

  IMPLEMENTATION_LANGUAGE_OV = [
    'applescript',
    'bash',
    'c',
    'c++',
    'c#',
    'go',
    'java',
    'javascript',
    'lua',
    'objective-c',
    'perl',
    'php',
    'powershell',
    'python',
    'ruby',
    'scala',
    'swift',
    'typescript',
    'visual-basic',
    'x86-32',
    'x86-64'
  ].freeze

  IMPLEMENTATION_CAPABILITIES_OV = [
    'accesses-remote-machines',
    'anti-debugging',
    'anti-disassembly',
    'anti-emulation',
    'anti-memory-forensics',
    'anti-sandbox',
    'anti-vm',
    'captures-input-peripherals',
    'captures-output-peripherals',
    'captures-system-state-data',
    'cleans-traces-of-infection',
    'commits-fraud',
    'communicates-with-c2',
    'compromises-data-availability',
    'compromises-data-integrity',
    'compromises-system-availability',
    'controls-local-machine',
    'degrades-security-software',
    'degrades-system-updates',
    'determines-c2-server',
    'emails-spam',
    'escalates-privileges',
    'evades-av',
    'exfiltrates-data',
    'fingerprints-host',
    'hides-artifacts',
    'hides-executing-code',
    'infects-files',
    'infects-remote-machines',
    'installs-other-components',
    'persists-after-system-reboot',
    'prevents-artifact-access',
    'prevents-artifact-deletion',
    'probes-network-environment',
    'self-modifies',
    'steals-authentication-credentials',
    'violates-system-operational-integrity'
  ].freeze

  INFRASTRUCTURE_TYPE_OV = [
    'amplification',
    'anonymization',
    'botnet',
    'command-and-control',
    'exfiltration',
    'hosting-malware',
    'hosting-target-lists',
    'phishing',
    'reconnaissance',
    'staging',
    'undefined'
  ].freeze

  ATTACK_RESOURCE_LEVEL_OV = [
    'individual',
    'club',
    'contest',
    'team',
    'organization',
    'government'
  ].freeze

  ATTACK_MOTIVATION_OV = [
    'accidental',
    'coercion',
    'dominance',
    'ideology',
    'notoriety',
    'organizational-gain',
    'personal-gain',
    'personal-satisfaction',
    'revenge',
    'unpredictable'
  ].freeze

  REGION_OV = [
    'eastern-africa',
    'middle-africa',
    'northern-africa',
    'southern-africa',
    'western-africa',
    'caribbean',
    'central-america',
    'latin-america-caribbean',
    'northern-america',
    'south-america',
    'central-asia',
    'eastern-asia',
    'southern-asia',
    'south-eastern-asia',
    'western-asia',
    'eastern-europe',
    'northern-europe',
    'southern-europe',
    'western-europe',
    'antarctica',
    'australia-new-zealand',
    'melanesia',
    'micronesia',
    'polynesia'
  ].freeze

  MALWARE_RESULT_OV = [
    'malicious',
    'suspicious',
    'benign',
    'unknown'
  ].freeze

  REPORT_TYPE_OV = [
    'attack-pattern',
    'campaign',
    'identity',
    'indicator',
    'intrusion-set',
    'malware',
    'observed-data',
    'threat-actor',
    'threat-report',
    'tool',
    'vulnerability'
  ].freeze

  THREAT_ACTOR_TYPE_OV = [
    'activist',
    'competitor',
    'crime-syndicate',
    'criminal',
    'hacker',
    'insider-accidental',
    'insider-disgruntled',
    'nation-state',
    'sensationalist',
    'spy',
    'terrorist',
    'unknown'
  ].freeze

  THREAT_ACTOR_ROLE_OV = [
    'agent',
    'director',
    'independent',
    'infrastructure-architect',
    'infrastructure-operator',
    'malware-author',
    'sponsor'
  ].freeze

  THREAT_ACTOR_SOPHISTICATION_OV = [
    'none',
    'minimal',
    'intermediate',
    'advanced',
    'expert',
    'innovator',
    'strategic'
  ].freeze

  TOOL_TYPES_OV = [
    'denial-of-service',
    'exploitation',
    'information-gathering',
    'network-capture',
    'credential-exploitation',
    'remote-access',
    'vulnerability-scanning',
    'unknown'
  ].freeze

  HASH_ALGORITHM_OV = [
    'MD5',
    'SHA-1',
    'SHA-256',
    'SHA-512',
    'SHA3-256',
    'SHA3-512',
    'SSDEEP',
    'TLSH'
  ].freeze

  ACCOUNT_TYPE_OV = [
    'facebook',
    'ldap',
    'nis',
    'openid',
    'radius',
    'skype',
    'tacacs',
    'twitter',
    'unix',
    'windows-local',
    'windows-domain'
  ].freeze

  WINDOWS_PEBINARY_TYPE_OV = [
    'dll',
    'exe',
    'sys'
  ].freeze
end
