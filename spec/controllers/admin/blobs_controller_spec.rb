require 'rails_helper'

RSpec.describe Admin::BlobsController, type: :request do
  include ActiveStorage::SetBlob

  describe '#show' do
    context 'when the admin user is logged in' do
      let(:admin_user) { create(:admin_user) }
      let(:audio_book) { create(:audio_book, admin_user: admin_user) }

      before do
        sign_in admin_user
      end

      it 'redirects temp file url' do
        get url_for(audio_book.audio_data)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
