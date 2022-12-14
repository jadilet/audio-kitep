require 'rails_helper'

RSpec.describe AllAudioBookByAdminTransaction do
  describe '#call' do
    subject { described_class.new(input).call }

    let(:admin_user) { create(:admin_user) }
    let(:input) { {} }

    context 'with audio books' do
      before do
        create(:audio_book, admin_user: admin_user)
      end

      it 'returns one audio book' do
        expect(subject[:audio_books].size).to eq(1)
      end
    end

    context 'without audio books' do
      it 'returns zero audio book' do
        expect(subject[:audio_books].size).to eq(0)
      end
    end
  end
end
