# frozen_string_literal: true

module IdentityRecords
  module Validators
    # Validates that the address on the record has a line1 and postcode
    # Some records have to have their line1 calculated from other details in the address class
    # outputs descriptive errors
    module AddressValidator
      def self.validate(address)
        errors = []

        if address.line1.nil? || address.line1.empty?
          # Check if we have all components to create line1
          if address.building_number.nil? || address.building_number.empty?
            errors << 'building number is required when line1 is missing'
          end

          if address.street_name.nil? || address.street_name.empty?
            errors << 'street name is required when line1 is missing'
          end

          if address.town.nil? || address.town.empty?
            errors << 'town is required when line1 is missing'
          end
        end

        if address.postcode.nil? || address.postcode.empty?
          errors << 'postcode is required'
        end

        errors
      end
    end
  end
end
