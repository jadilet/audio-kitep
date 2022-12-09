class AudioBook < ApplicationRecord
  has_one_attached :audio_data
end
