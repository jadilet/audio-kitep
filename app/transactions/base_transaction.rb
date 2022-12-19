class BaseTransaction
  def initialize(input)
    @input = input
  end

  def call
    return input if input.key?(:error)

    process_transaction
  rescue StandardError => e
    input[:error] = "#{self.class} #{e.message}"

    input
  ensure
    input
  end

  protected

  def process_transaction
    raise NotImplementedError
  end

  private

  attr_accessor :input
end
