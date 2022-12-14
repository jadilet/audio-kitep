require 'csv'

class GenerateCsvFile
  def initialize(input)
    @input = input
  end

  def call
    generate_csv_file
  end

  private

  def generate_csv_file
    attributes = %w[person total_uploaded_audio]

    Tempfile.new(["export_#{Time.zone.now.strftime('%Y%m%d%H%M%S')}_#{input[:model]}", '.csv']).tap do |file|
      CSV.open(file, 'wb') do |csv|
        csv << attributes

        input[:audio_books].each do |k, v|
          csv << [k.first, v]
        end
      end
    end
  end

  attr_accessor :input
end
