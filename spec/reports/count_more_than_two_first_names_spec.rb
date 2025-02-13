# frozen_string_literal: true

require 'spec_helper'

module IdentityRecords
  module Reporters
    RSpec.describe MetricsReporter do
      describe '.count_more_than_two_first_names' do
        let(:person_with_one_name) { double('Person', firstNames: 'John') }
        let(:person_with_two_names) { double('Person', firstNames: 'John James') }
        let(:person_with_three_names) { double('Person', firstNames: 'John James Robert') }
        let(:person_with_four_names) { double('Person', firstNames: 'John James Robert William') }
        let(:person_with_nil_names) { double('Person', firstNames: nil) }
        let(:person_with_empty_names) { double('Person', firstNames: '') }

        it 'returns 0 when no people have more than two first names' do
          people = [person_with_one_name, person_with_two_names]
          expect(described_class.count_more_than_two_first_names(people)).to eq(0)
        end

        it 'counts people with exactly three first names' do
          people = [person_with_three_names]
          expect(described_class.count_more_than_two_first_names(people)).to eq(1)
        end

        it 'counts people with more than three first names' do
          people = [person_with_four_names]
          expect(described_class.count_more_than_two_first_names(people)).to eq(1)
        end

        it 'handles mixed cases correctly' do
          people = [
            person_with_one_name,
            person_with_two_names,
            person_with_three_names,
            person_with_four_names
          ]
          expect(described_class.count_more_than_two_first_names(people)).to eq(2)
        end

        it 'handles nil first names' do
          people = [person_with_nil_names]
          expect(described_class.count_more_than_two_first_names(people)).to eq(0)
        end

        it 'handles empty first names' do
          people = [person_with_empty_names]
          expect(described_class.count_more_than_two_first_names(people)).to eq(0)
        end

        it 'returns 0 for empty array' do
          expect(described_class.count_more_than_two_first_names([])).to eq(0)
        end
      end
    end
  end
end
