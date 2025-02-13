module IdentityRecords
  module Models
    # Takes in an XML record and uses those details to form a person record
    # This person can then be validated
    class IdentityRecord
      attr_accessor :firstNames, :lastNames, :dateOfBirth, :Address,
                    :yearsAtAddress, :passportNumber, :nationalInsuranceNumber,
                    :validation_errors, :person_node

      def initialize(person_node)
        @person_node = person_node
        @firstNames = person_node.at_xpath('./firstNames')&.text
        @lastNames = person_node.at_xpath('./lastName')&.text
        @dateOfBirth = person_node.at_xpath('./dateOfBirth')&.text
        @yearsAtAddress = person_node.at_xpath('./yearsAtAddress')&.text&.to_i
        @passportNumber = person_node.at_xpath('./passportNumber')&.text
        @nationalInsuranceNumber = person_node.at_xpath('./nationalInsuranceNumber')&.text
        @Address = Address.new(person_node.at_xpath('./address'))
      end

      def valid?
        @validation_errors = Validators::RecordValidator.validate(self)
        @validation_errors.empty?
      end
    end
  end
end
