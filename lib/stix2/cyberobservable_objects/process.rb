module Stix2
  module CyberobservableObject
    class Process < Base
      property :is_hidden, coerce: Stix2.bool
      property :pid, coerce: Integer
      property :created_time, coerce: Time
      property :cwd, coerce: String
      property :command_line, coerce: String
      property :environment_variables, coerce: Hash
      property :opened_connection_refs, coerce: [Identifier]
      property :creator_user_ref, coerce: Identifier
      property :image_ref, coerce: Identifier
      property :parent_ref, coerce: Identifier
      property :child_refs, coerce: [Identifier]
    end
  end
end
