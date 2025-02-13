# frozen_string_literal: true

module IdentityRecords
  module Validators
    RSpec.describe AddressValidator do
      let(:valid_address) do
        double('Address',
               line1: '123 Test Street',
               postcode: 'SW1A 1AA',
               building_number: nil,
               street_name: nil,
               town: nil
        )
      end

      describe '.validate' do
        context 'with valid addresses' do
          it 'returns no errors when line1 and postcode are present' do
            expect(AddressValidator.validate(valid_address)).to be_empty
          end

          it 'returns no errors when using component parts instead of line1' do
            address = double('Address',
                             line1: nil,
                             postcode: 'SW1A 1AA',
                             building_number: '123',
                             street_name: 'Test Street',
                             town: 'London'
            )
            expect(AddressValidator.validate(address)).to be_empty
          end
        end

        context 'when line1 is missing' do
          it 'returns error when building number is missing' do
            address = double('Address',
                             line1: nil,
                             postcode: 'SW1A 1AA',
                             building_number: nil,
                             street_name: 'Test Street',
                             town: 'London'
            )
            expect(AddressValidator.validate(address))
              .to include('building number is required when line1 is missing')
          end

          it 'returns error when street name is missing' do
            address = double('Address',
                             line1: nil,
                             postcode: 'SW1A 1AA',
                             building_number: '123',
                             street_name: nil,
                             town: 'London'
            )
            expect(AddressValidator.validate(address))
              .to include('street name is required when line1 is missing')
          end

          it 'returns error when town is missing' do
            address = double('Address',
                             line1: nil,
                             postcode: 'SW1A 1AA',
                             building_number: '123',
                             street_name: 'Test Street',
                             town: nil
            )
            expect(AddressValidator.validate(address))
              .to include('town is required when line1 is missing')
          end

          it 'returns multiple errors when all components are missing' do
            address = double('Address',
                             line1: nil,
                             postcode: 'SW1A 1AA',
                             building_number: nil,
                             street_name: nil,
                             town: nil
            )
            errors = AddressValidator.validate(address)
            expect(errors).to include('building number is required when line1 is missing')
            expect(errors).to include('street name is required when line1 is missing')
            expect(errors).to include('town is required when line1 is missing')
          end
        end

        context 'when postcode is missing' do
          it 'returns error when postcode is nil' do
            address = double('Address',
                             line1: '123 Test Street',
                             postcode: nil,
                             building_number: nil,
                             street_name: nil,
                             town: nil
            )
            expect(AddressValidator.validate(address))
              .to include('postcode is required')
          end

          it 'returns error when postcode is empty' do
            address = double('Address',
                             line1: '123 Test Street',
                             postcode: '',
                             building_number: nil,
                             street_name: nil,
                             town: nil
            )
            expect(AddressValidator.validate(address))
              .to include('postcode is required')
          end
        end

        context 'with multiple validation failures' do
          it 'returns all relevant errors' do
            address = double('Address',
                             line1: nil,
                             postcode: nil,
                             building_number: nil,
                             street_name: nil,
                             town: nil
            )
            errors = AddressValidator.validate(address)
            expect(errors).to include('building number is required when line1 is missing')
            expect(errors).to include('street name is required when line1 is missing')
            expect(errors).to include('town is required when line1 is missing')
            expect(errors).to include('postcode is required')
          end
        end

        context 'with empty strings' do
          it 'treats empty strings the same as nil' do
            address = double('Address',
                             line1: '',
                             postcode: '',
                             building_number: '',
                             street_name: '',
                             town: ''
            )
            errors = AddressValidator.validate(address)
            expect(errors).to include('building number is required when line1 is missing')
            expect(errors).to include('street name is required when line1 is missing')
            expect(errors).to include('town is required when line1 is missing')
            expect(errors).to include('postcode is required')
          end
        end
      end
    end
  end
end
