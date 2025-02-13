# frozen_string_literal: true

module IdentityRecords
  # Takes in XML records, sorts them into valid or invalid
  class XmlProcessor
    def self.process(xml_string)
      valid_people = []
      invalid_people = []

      doc = Nokogiri::XML(xml_string)
      doc.xpath('//person').each do |person_node|
        person = Models::IdentityRecord.new(person_node)

        if person.valid?
          valid_people << person
        else
          invalid_people << person
        end
      end

      [valid_people, invalid_people]
    end
  end
end
