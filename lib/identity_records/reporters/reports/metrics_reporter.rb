# frozen_string_literal: true

module IdentityRecords
  module Reporters
    # Handles the console output of validation metrics and statistics
    module MetricsReporter
      def self.output(valid_people, invalid_people)
        output_summary(valid_people, invalid_people)
        output_details(valid_people + invalid_people)
      end

      def self.output_summary(valid_people, invalid_people)
        puts "\nValidation Summary"
        puts "================="
        puts "Valid records: #{valid_people.length}"
        puts "Invalid records: #{invalid_people.length}"
        puts "Total records processed: #{valid_people.length + invalid_people.length}"
      end

      def self.output_details(all_people)
        puts "\nDetailed Metrics"
        puts "==============="
        puts "Multiple first names: #{count_more_than_two_first_names(all_people)}"
        puts "Missing identification: #{count_missing_identification(all_people)}"
        puts "Less than 5 years at address: #{count_short_address_duration(all_people)}"
      end

      def self.count_more_than_two_first_names(people)
        people.count { |p| p.firstNames&.split(/\s+/)&.length.to_i > 2 }
      end

      def self.count_missing_identification(people)
        people.count { |p| p.passportNumber.nil? && p.nationalInsuranceNumber.nil? }
      end

      def self.count_short_address_duration(people)
        people.count { |p| p.yearsAtAddress.to_i < 5 }
      end
    end
  end
end
