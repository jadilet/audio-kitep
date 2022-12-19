require 'rails_helper'

RSpec.describe GenerateCsvFileTransaction do
  describe '#call' do
    subject { described_class.new(input).call }

    context 'with input\'s audio_books and model data' do
      let(:audio_books) { { ['admin@exampl.com2', 2] => 3, ['admin@example.com', 1] => 3 } }
      let(:input) { { audio_books: audio_books, model: 'audio_book' } }

      it 'returns object of Tempfile' do
        expect(subject[:file]).to be_kind_of(Tempfile)
      end
    end

    context 'without input\'s audio_books and model data' do
      let(:input) { {} }

      it 'returns an error message' do
        expect(subject[:error]).not_to be_nil
      end
    end
  end
end
