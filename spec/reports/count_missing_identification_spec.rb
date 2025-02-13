# frozen_string_literal: true

module IdentityRecords
  module Reporters
    RSpec.describe MetricsReporter do
      describe '.count_missing_identification' do
        let(:person_with_passport) do
          double('Person', passportNumber: '123456789', nationalInsuranceNumber: nil)
        end

        let(:person_with_ni) do
          double('Person', passportNumber: nil, nationalInsuranceNumber: 'AB123456C')
        end

        let(:person_with_both) do
          double('Person', passportNumber: '123456789', nationalInsuranceNumber: 'AB123456C')
        end

        let(:person_with_neither) do
          double('Person', passportNumber: nil, nationalInsuranceNumber: nil)
        end

        it 'returns 0 when all people have identification' do
          people = [person_with_passport, person_with_ni, person_with_both]
          expect(described_class.count_missing_identification(people)).to eq(0)
        end

        it 'counts people with no identification' do
          people = [person_with_neither]
          expect(described_class.count_missing_identification(people)).to eq(1)
        end

        it 'handles mixed cases correctly' do
          people = [
            person_with_passport,
            person_with_ni,
            person_with_both,
            person_with_neither
          ]
          expect(described_class.count_missing_identification(people)).to eq(1)
        end

        it 'returns 0 for no records' do
          expect(described_class.count_missing_identification([])).to eq(0)
        end
      end
    end
  end
end
