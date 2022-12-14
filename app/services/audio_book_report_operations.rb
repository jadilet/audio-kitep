class AudioBookReportOperations
  def initialize(model)
    @model = model
  end

  def call
    input = { model: model }
    AllAudioBookByAdminTransaction.new(input).call
    GenerateCsvFile.new(input).call
  end

  private

  attr_accessor :model
end
