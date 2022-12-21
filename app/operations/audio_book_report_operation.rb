class AudioBookReportOperation
  def initialize(model)
    @model = model
  end

  def call
    input = { model: }
    input = AllAudioBookByAdminTransaction.new(input).call
    GenerateCsvFileTransaction.new(input).call
  end

  private

  attr_accessor :model
end
