module Stix2
  module CyberobservableObject
    class X509V3ExtensionType < Base
      property :basic_constraints, coerce: String
      property :name_constraints, coerce: String
      property :policy_constraints, coerce: String
      property :key_usage, coerce: String
      property :extended_key_usage, coerce: String
      property :subject_key_identifier, coerce: String
      property :authority_key_identifier, coerce: String
      property :subject_alternative_name, coerce: String
      property :issuer_alternative_name, coerce: String
      property :subject_directory_attributes, coerce: String
      property :crl_distribution_points, coerce: String
      property :inhibit_any_policy, coerce: String
      property :private_key_usage_period_not_before, coerce: Time
      property :private_key_usage_period_not_after, coerce: Time
      property :certificate_policies, coerce: String
      property :policy_mappings, coerce: String
    end
  end
end
