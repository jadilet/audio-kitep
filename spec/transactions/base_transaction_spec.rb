require 'rails_helper'

RSpec.describe BaseTransaction do
  describe '#call' do
    subject { described_class.new(input).call }

    let(:input) { {} }

    it 'raises an error' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end
