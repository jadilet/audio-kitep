class CreateAudioBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :audio_books do |t|

      t.timestamps
    end
  end
end
