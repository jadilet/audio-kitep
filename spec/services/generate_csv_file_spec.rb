require 'rails_helper'

RSpec.describe GenerateCsvFile do
  subject { described_class.new(attributes, data, model_name).call }

  context 'with empty params' do
    let(:attributes) { nil }
    let(:data) { nil }
    let(:model_name) { nil }

    it 'raises an error' do
      expect { subject }.to raise_error(StandardError)
    end
  end

  context 'with params' do
    let(:attributes) { ['Column 1', 'Column 2'] }
    let(:data) { { ['admin@exampl.com2', 2] => 3, ['admin@example.com', 1] => 3 } }
    let(:model_name) { nil }

    it 'returns an object of Tempfile' do
      expect(subject).to be_kind_of(Tempfile)
    end
  end
end
