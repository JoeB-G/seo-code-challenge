# frozen_string_literal: true

module IdentityRecords
  module Validators
    # This class groups all the different validators, and uses them on a record, collecting any errors
    # it combines all the errors with reasons into one array and returns ti
    class Record
      def self.validate(record)
        errors = {}
        # Name validations
        first_name_errors = Name.validate(record.firstNames, 'first names')
        errors[:first_names] = first_name_errors unless first_name_errors.empty?

        last_name_errors = Name.validate(record.lastNames, 'last name')
        errors[:last_name] = last_name_errors unless last_name_errors.empty?

        # Age validation
        age_errors = Age.validate(record.dateOfBirth)
        errors[:date_of_birth] = age_errors unless age_errors.empty?

        # Address validation
        address_errors = Address.validate(record.Address)
        errors[:address] = address_errors unless address_errors.empty?

        # Years at address validation
        years_errors = YearsAtAddress.validate(record.yearsAtAddress)
        errors[:years_at_address] = years_errors unless years_errors.empty?

        # Identification validation
        id_errors = Identification.validate(
          record.passportNumber,
          record.nationalInsuranceNumber
        )
        errors[:identification] = id_errors unless id_errors.empty?

        errors
      end
    end
  end
end
