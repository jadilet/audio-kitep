require 'rails_helper'

RSpec.describe AudioBookReportOperation do
  subject { described_class.new('audio_book').call }

  let(:admin_user) { create(:admin_user) }

  context 'when audio book is empty' do
    it { expect(subject[:error]).not_to be_nil }
  end

  context 'when audio book is not empty' do
    before do
      create(:audio_book, admin_user: admin_user)
    end

    it { expect(subject[:file]).to be_kind_of(Tempfile) }
  end
end
