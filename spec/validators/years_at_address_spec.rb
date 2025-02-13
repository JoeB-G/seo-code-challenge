# frozen_string_literal: true
module IdentityRecords
  module Validators
    RSpec.describe YearsAtAddressValidator do
      describe '.validate' do
        it 'returns no errors when years at address is 5' do
          expect(YearsAtAddressValidator.validate(5)).to be_empty
        end

        it 'returns no errors when years at address is greater than 5' do
          expect(YearsAtAddressValidator.validate(7)).to be_empty
        end

        it 'returns error when years at address is less than 5' do
          expect(YearsAtAddressValidator.validate(4)).to include('must be at least 5 years')
        end

        it 'returns error when years at address is 0' do
          expect(YearsAtAddressValidator.validate(0)).to include('must be at least 5 years')
        end

        it 'returns error when years at address is negative' do
          expect(YearsAtAddressValidator.validate(-1)).to include('must be at least 5 years')
        end

        it 'returns error when years at address is nil' do
          expect(YearsAtAddressValidator.validate(nil)).to include('years at address cannot be empty')
        end
      end
    end
  end
end
