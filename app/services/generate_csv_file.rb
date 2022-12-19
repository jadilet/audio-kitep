require 'csv'

class GenerateCsvFile
  def initialize(attributes, data, model_name)
    @attributes = attributes
    @data = data
    @model_name = model_name
  end

  def call
    raise StandardError, 'Attributes can\'t be empty' if attributes.blank?
    raise StandardError, 'Data can\'t be empty' if data.blank?

    generate_csv_file
  end

  private

  def generate_csv_file
    Tempfile.new(["export_#{Time.zone.now.strftime('%Y%m%d%H%M%S')}_#{model_name}", '.csv']).tap do |file|
      CSV.open(file, 'wb') do |csv|
        csv << attributes

        data.each do |k, v|
          csv << [k.first, v]
        end
      end
    end
  end

  attr_accessor :attributes, :data, :model_name
end
