# frozen_string_literal: true

module IdentityRecords
  module Validators
    # Validates that the age of the person on the record is greater than a configurable limit
    # contains helper functions to calculate the persons age from their date of birth
    # outputs descriptive errors if invalid
    module AgeValidator

      MINIMUM_AGE = 18

      def self.calculate_age(date_of_birth)
        today = Date.today
        age = today.year - date_of_birth.year
        if today.month < date_of_birth.month ||
           (today.month == date_of_birth.month && today.day < date_of_birth.day)
          age -= 1
        end
        age
      end

      def self.parse_date(date_string)
        Date.parse(date_string) if date_string
      end

      def self.validate(date_of_birth)
        errors = []
        date_of_birth = parse_date(date_of_birth)
        if date_of_birth
          age = calculate_age(date_of_birth)
          errors << 'must be at least 18 years old' if age < MINIMUM_AGE
        else
          errors << 'Record must include date of birth'
        end
        errors
      end
    end
  end
end
