require 'spec_helper'

module IdentityRecords
  module Validators
    RSpec.describe NameValidator do
      describe '.validate' do
        context 'with valid names' do
          it 'returns no errors for simple name' do
            expect(NameValidator.validate('John')).to be_empty
          end

          it 'returns no errors for name with space' do
            expect(NameValidator.validate('John Smith')).to be_empty
          end

          it 'returns no errors for name with apostrophe' do
            expect(NameValidator.validate("O'Connor")).to be_empty
          end

          it 'returns no errors for name with hyphen' do
            expect(NameValidator.validate('Mary-Jane')).to be_empty
          end

          it 'returns no errors for name with multiple special characters' do
            expect(NameValidator.validate("Jean-Marie O'Brien")).to be_empty
          end

          it 'returns no errors for name at maximum length' do
            name = 'a' * NameValidator::MAX_LENGTH
            expect(NameValidator.validate(name)).to be_empty
          end
        end

        context 'with invalid names' do
          it 'returns error when name is nil' do
            expect(NameValidator.validate(nil))
              .to include('name cannot be empty')
          end

          it 'returns error when name is empty' do
            expect(NameValidator.validate(''))
              .to include('name cannot be empty')
          end

          it 'returns error when name is too long' do
            name = 'a' * (NameValidator::MAX_LENGTH + 1)
            expect(NameValidator.validate(name))
              .to include("name must be #{NameValidator::MAX_LENGTH} characters or less")
          end

          it 'returns error when name contains numbers' do
            expect(NameValidator.validate('John123'))
              .to include('name can only contain letters, apostrophes, hyphens and spaces')
          end

          it 'returns error when name contains special characters' do
            expect(NameValidator.validate('John@Doe'))
              .to include('name can only contain letters, apostrophes, hyphens and spaces')
          end

          it 'returns multiple errors when multiple rules are violated' do
            errors = NameValidator.validate('John@123')
            expect(errors).to include('name can only contain letters, apostrophes, hyphens and spaces')
          end
        end

        context 'with custom field name' do
          it 'uses custom field name in error messages' do
            expect(NameValidator.validate('', 'first name'))
              .to include('first name cannot be empty')
          end

          it 'uses custom field name in length error' do
            name = 'a' * (NameValidator::MAX_LENGTH + 1)
            expect(NameValidator.validate(name, 'last name'))
              .to include("last name must be #{NameValidator::MAX_LENGTH} characters or less")
          end

          it 'uses custom field name in format error' do
            expect(NameValidator.validate('John123', 'middle name'))
              .to include('middle name can only contain letters, apostrophes, hyphens and spaces')
          end
        end
      end
    end
  end
end