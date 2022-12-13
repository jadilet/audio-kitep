class AddAdminUserToAudioBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :audio_books, :admin_user, null: false, foreign_key: true
  end
end
