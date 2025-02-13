# frozen_string_literal: true

module IdentityRecords
  module Reporters
    class ValidationReporter
      def initialize(output_directory = 'output')
        @output_directory = output_directory
        @timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
        FileUtils.mkdir_p(@output_directory)
      end

      def report(valid_people, invalid_people)
        MetricsReporter.report_metrics(valid_people, invalid_people)
        ValidRecordsXmlGenerator.generate(valid_people, @output_directory, @timestamp)
        InvalidRecordsXmlGenerator.generate(invalid_people, @output_directory, @timestamp)
      end
    end
  end
end
