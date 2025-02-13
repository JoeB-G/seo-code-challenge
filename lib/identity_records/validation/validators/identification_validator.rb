# frozen_string_literal: true

module IdentityRecords
  module Validators
    # Validates that the record has either a passport number or NI number
    # outputs descriptive errors if invalid
    module IdentificationValidator
      def self.validate(passport_number, national_insurance_number)
        errors = []
        if (passport_number.nil? || passport_number.empty?) &&
           (national_insurance_number.nil? || national_insurance_number.empty?)
          errors << 'must provide either passport number or national insurance number'
        end
        errors
      end
    end
  end
end
