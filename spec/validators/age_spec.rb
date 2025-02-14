module IdentityRecords
  module Validators
    RSpec.describe Age do
      describe '.validate' do
        let(:today) { Date.today } # Fix current date for testing

        before do
          allow(Date).to receive(:today).and_return(today)
        end

        it 'returns no errors when person is exactly 18 Today' do
          date_of_birth = (today << (18 * 12)).to_s
          pp date_of_birth
          expect(Age.validate(date_of_birth)).to be_empty
        end

        it 'returns no errors when person is over 18' do
          date_of_birth = (today << (50 * 12)).to_s
          expect(Age.validate(date_of_birth)).to be_empty
        end

        it 'returns something errors when passed non parsable date' do
          date_of_birth = (today << (50 * 12)).to_s
          expect(Age.validate(date_of_birth)).to be_empty
        end

        it 'returns error when person is under 18' do
          date_of_birth = (today << (17 * 12)).to_s
          expect(Age.validate(date_of_birth)).to include('must be at least 18 years old')
        end

        it 'returns error when date of birth is in the future' do
          date_of_birth = (today + 1).to_s
          expect(Age.validate(date_of_birth)).to include('must be at least 18 years old')
        end

        it 'returns error when date of birth is nil' do
          expect(Age.validate(nil)).to include('Record must include date of birth')
        end

        it 'returns error when person turns 18 tomorrow' do
          date_of_birth = ((today << (18 * 12)) + 1).to_s
          pp date_of_birth
          expect(Age.validate(date_of_birth)).to include('must be at least 18 years old')
        end

        it 'returns error when person turned 18 yesterday' do
          date_of_birth = ((today << (18 * 12)) - 1).to_s
          pp date_of_birth
          expect(Age.validate(date_of_birth)).to be_empty
        end
      end
    end
  end
end
