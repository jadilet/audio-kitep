FactoryBot.define do
  factory(:audio_book) do
    admin_user
    after(:build) do |audio_book|
      audio_book.audio_data.attach(io: File.open(Rails.root.join('spec', 'factories', 'files', 'mp.mp4')),
                                   filename: 'mp.mp4', content_type: 'audio/mpeg')
    end
  end
end
