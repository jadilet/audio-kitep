class GenerateCsvFileTransaction < BaseTransaction
  def process_transaction
    attributes = %w[person total_uploaded_audio]
    input[:file] = GenerateCsvFile.new(attributes, input[:audio_books], input[:model]).call

    input
  end
end
