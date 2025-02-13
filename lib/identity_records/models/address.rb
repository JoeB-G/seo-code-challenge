# frozen_string_literal: true

module IdentityRecords
  module Models
    # Consumes address data from XML node, calculates line1 there is no line1 but we have the required fields to create
    # This makes validation easier in our address validator
    class Address
      attr_accessor :line1, :postcode, :building_number, :street_name, :town

      def initialize(address_node)
        if address_node&.at_xpath('./line1')
          @line1 = address_node.at_xpath('./line1')&.text
        else
          @building_number = address_node&.at_xpath('./buildingNumber')&.text
          @street_name = address_node&.at_xpath('./streetName')&.text
          @town = address_node&.at_xpath('./town')&.text
          if @building_number && @street_name && @town
            @line1 = [@building_number, @street_name, @town].compact.join(' ')
          end
        end
        @postcode = address_node&.at_xpath('./postcode')&.text
      end
    end
  end
end
