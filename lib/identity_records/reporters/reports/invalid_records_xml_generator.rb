# frozen_string_literal: true

module IdentityRecords
  module Reporters
    # Handles XML file generation for invalid records while preserving original format
    module InvalidRecordsXmlGenerator
      module_function

      def generate(invalid_people, output_directory, timestamp)
        builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
          xml.invalidRecords do
            invalid_people.each do |person|
              add_errors_to_invalid_record(xml, person)
            end
          end
        end

        write_xml(builder, output_directory, "invalid_records_#{timestamp}.xml")
      end

      def add_errors_to_invalid_record(xml, person)
        # Parse the original XML for this person
        original_xml = Nokogiri::XML.fragment(person.person_node)

        xml.person do
          # Copy all original nodes from the stored XML
          original_xml.at_xpath('.//person').elements.each do |element|
            xml << element.to_xml
          end

          add_validation_errors(xml, person.validation_errors)
        end
      end

      def add_validation_errors(xml, validation_errors)
        xml.validationErrors do
          validation_errors.each do |field, messages|
            xml.error do
              xml.field field
              xml.messages do
                messages.each { |message| xml.message message }
              end
            end
          end
        end
      end

      def write_xml(builder, directory, filename)
        File.write(File.join(directory, filename), builder.to_xml)
      end
    end
  end
end
