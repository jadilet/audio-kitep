class AudioBook < ApplicationRecord
  belongs_to :admin_user
  has_one_attached :audio_data
end
