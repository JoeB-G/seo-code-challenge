# frozen_string_literal: true

module IdentityRecords
  module Reporters
    RSpec.describe MetricsReporter do
      describe '.count_short_address_duration' do
        let(:person_with_4_years) { double('Person', yearsAtAddress: '4') }
        let(:person_with_5_years) { double('Person', yearsAtAddress: '5') }
        let(:person_with_6_years) { double('Person', yearsAtAddress: '6') }
        let(:person_with_nil_years) { double('Person', yearsAtAddress: nil) }
        let(:person_with_empty_years) { double('Person', yearsAtAddress: '') }
        let(:person_with_zero_years) { double('Person', yearsAtAddress: '0') }

        it 'returns 0 when all people have lived 5+ years at address' do
          people = [person_with_5_years, person_with_6_years]
          expect(described_class.count_short_address_duration(people)).to eq(0)
        end

        it 'counts people with less than 5 years at address' do
          people = [person_with_4_years]
          expect(described_class.count_short_address_duration(people)).to eq(1)
        end

        it 'handles mixed cases correctly' do
          people = [
            person_with_4_years,
            person_with_5_years,
            person_with_6_years
          ]
          expect(described_class.count_short_address_duration(people)).to eq(1)
        end

        it 'counts nil years as less than 5' do
          people = [person_with_nil_years]
          expect(described_class.count_short_address_duration(people)).to eq(1)
        end

        it 'counts empty years as less than 5' do
          people = [person_with_empty_years]
          expect(described_class.count_short_address_duration(people)).to eq(1)
        end

        it 'counts zero years as less than 5' do
          people = [person_with_zero_years]
          expect(described_class.count_short_address_duration(people)).to eq(1)
        end

        it 'returns 0 for no records' do
          expect(described_class.count_short_address_duration([])).to eq(0)
        end
      end
    end
  end
end
