module Stix2
  module CyberobservableObject
    class UserAccount < Base
      property :user_id, coerce: String
      property :credential, coerce: String
      property :account_login, coerce: String
      property :account_type, values: ACCOUNT_TYPE_OV
      property :display_name, coerce: String
      property :is_service_account, coerce: ->(value){ Stix2.to_bool(value) }
      property :is_privileged, coerce: ->(value){ Stix2.to_bool(value) }
      property :can_escalate_privs, coerce: ->(value){ Stix2.to_bool(value) }
      property :is_disabled, coerce: ->(value){ Stix2.to_bool(value) }
      property :account_created, coerce: Time
      property :account_expires, coerce: Time
      property :credential_last_changed, coerce: Time
      property :account_first_login, coerce: Time
      property :account_last_login, coerce: Time
    end
  end
end
