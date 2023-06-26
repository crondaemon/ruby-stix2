module Stix2
  module CyberobservableObject
    class Process < Base
      property :is_hidden, coerce: ->(value){ Stix2.to_bool(value) }
      property :pid, coerce: Integer
      property :created_time, coerce: Time
      property :cwd, coerce: String
      property :command_line, coerce: String
      property :environment_variables, coerce: Hash
      property :opened_connection_refs, coerce: Array[Identifier]
      property :creator_user_ref, coerce: Identifier
      property :image_ref, coerce: Identifier
      property :parent_ref, coerce: Identifier
      property :child_refs, coerce: Array[Identifier]
    end
  end
end
