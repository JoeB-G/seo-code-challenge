module IdentityRecords
  module Validators
    RSpec.describe IdentificationValidator do
      describe '.validate' do
        it 'returns no errors when passport number is present' do
          expect(IdentificationValidator.validate('123456789', nil)).to be_empty
        end

        it 'returns no errors when national insurance number is present' do
          expect(IdentificationValidator.validate(nil, 'AB123456C')).to be_empty
        end

        it 'returns no errors when both identifiers are present' do
          expect(IdentificationValidator.validate('123456789', 'AB123456C')).to be_empty
        end

        it 'returns error when both identifiers are nil' do
          expect(IdentificationValidator.validate(nil, nil))
            .to include('must provide either passport number or national insurance number')
        end

        it 'returns error when both identifiers are empty strings' do
          expect(IdentificationValidator.validate('', ''))
            .to include('must provide either passport number or national insurance number')
        end

        it 'returns error when passport is empty string and NI number is nil' do
          expect(IdentificationValidator.validate('', nil))
            .to include('must provide either passport number or national insurance number')
        end

        it 'returns error when passport is nil and NI number is empty string' do
          expect(IdentificationValidator.validate(nil, ''))
            .to include('must provide either passport number or national insurance number')
        end
      end
    end
  end
end
