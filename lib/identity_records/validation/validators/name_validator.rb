# frozen_string_literal: true
module IdentityRecords
  module Validators
    # Validates that the name on the record meets configurable conditions
    # outputs descriptive errors if invalid
    module NameValidator
      NAME_REGEX = /^[a-zA-Z' -]+$/
      MAX_LENGTH = 45

      def self.validate(name, field_name = 'name')
        errors = []
        errors << "#{field_name} cannot be empty" if name.nil? || name.empty?
        errors << "#{field_name} must be #{MAX_LENGTH} characters or less" if name&.length.to_i > MAX_LENGTH
        unless name&.match?(NAME_REGEX)
          errors << "#{field_name} can only contain letters, apostrophes, hyphens and spaces"
        end
        errors
      end
    end
  end
end
