# frozen_string_literal: true

module IdentityRecords
  module Validators
    # Validates that a record has a configurable number of years spent at their listed address
    # Outputs descriptive errors if invalid
    module YearsAtAddressValidator
      MINIMUM_YEARS = 5

      def self.validate(years)
        errors = []
        errors << 'years at address cannot be empty' if years.nil?
        errors << "must be at least #{MINIMUM_YEARS} years" if years && years < MINIMUM_YEARS
        errors
      end
    end
  end
end
