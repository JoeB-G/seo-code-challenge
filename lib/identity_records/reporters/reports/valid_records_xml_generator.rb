# frozen_string_literal: true

module IdentityRecords
  module Reporters
    # module to generate a new xml with correct formatting of the valid records and output to file
    module ValidRecordsXmlGenerator
      module_function

      def generate(valid_people, output_directory, timestamp)
        builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
          xml.validRecords do
            valid_people.each { |person| build_person_xml(xml, person) }
          end
        end

        write_xml(builder, output_directory, "valid_records_#{timestamp}.xml")
      end

      def build_person_xml(xml, person)
        xml.person do
          add_person_details(xml, person)
          add_address_details(xml, person.Address)
        end
      end

      def add_person_details(xml, person)
        xml.firstNames title_case(person.firstNames)
        xml.lastNames title_case(person.lastNames)
        xml.dateOfBirth format_date(person.dateOfBirth)
        xml.yearsAtAddress(person.yearsAtAddress.to_i, type: 'integer')
        xml.passportNumber person.passportNumber
        xml.nationalInsuranceNumber person.nationalInsuranceNumber
      end

      def add_address_details(xml, address)
        xml.address do
          xml.line1 address.line1
          xml.postcode address.postcode
        end
      end

      def write_xml(builder, directory, filename)
        File.write(File.join(directory, filename), builder.to_xml)
      end

      def title_case(str)
        str&.split(/\s+/)&.map(&:capitalize)&.join(' ')
      end

      def format_date(date)
        Date.parse(date).strftime('%d, %b, %Y')
      end
    end
  end
end
