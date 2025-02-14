require 'spec_helper'

module IdentityRecords
  module Validators
    RSpec.describe Name do
      describe '.validate' do
        context 'with valid names' do
          it 'returns no errors for simple name' do
            expect(Name.validate('John')).to be_empty
          end

          it 'returns no errors for name with space' do
            expect(Name.validate('John Smith')).to be_empty
          end

          it 'returns no errors for name with apostrophe' do
            expect(Name.validate("O'Connor")).to be_empty
          end

          it 'returns no errors for name with hyphen' do
            expect(Name.validate('Mary-Jane')).to be_empty
          end

          it 'returns no errors for name with multiple special characters' do
            expect(Name.validate("Jean-Marie O'Brien")).to be_empty
          end

          it 'returns no errors for name at maximum length' do
            name = 'a' * Name::MAX_LENGTH
            expect(Name.validate(name)).to be_empty
          end
        end

        context 'with invalid names' do
          it 'returns error when name is nil' do
            expect(Name.validate(nil))
              .to include('name cannot be empty')
          end

          it 'returns error when name is empty' do
            expect(Name.validate(''))
              .to include('name cannot be empty')
          end

          it 'returns error when name is too long' do
            name = 'a' * (Name::MAX_LENGTH + 1)
            expect(Name.validate(name))
              .to include("name must be #{Name::MAX_LENGTH} characters or less")
          end

          it 'returns error when name contains numbers' do
            expect(Name.validate('John123'))
              .to include('name can only contain letters, apostrophes, hyphens and spaces')
          end

          it 'returns error when name contains special characters' do
            expect(Name.validate('John@Doe'))
              .to include('name can only contain letters, apostrophes, hyphens and spaces')
          end

          it 'returns multiple errors when multiple rules are violated' do
            errors = Name.validate('John@123')
            expect(errors).to include('name can only contain letters, apostrophes, hyphens and spaces')
          end
        end

        context 'with custom field name' do
          it 'uses custom field name in error messages' do
            expect(Name.validate('', 'first name'))
              .to include('first name cannot be empty')
          end

          it 'uses custom field name in length error' do
            name = 'a' * (Name::MAX_LENGTH + 1)
            expect(Name.validate(name, 'last name'))
              .to include("last name must be #{Name::MAX_LENGTH} characters or less")
          end

          it 'uses custom field name in format error' do
            expect(Name.validate('John123', 'middle name'))
              .to include('middle name can only contain letters, apostrophes, hyphens and spaces')
          end
        end
      end
    end
  end
end