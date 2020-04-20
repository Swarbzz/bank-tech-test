require './lib/statement'

describe Statement do
  subject(:statement) { described_class.new }
  
  context 'New Statement' do
    describe '#initialize' do
      it 'is empty' do
        expect(statement.record).to eq []
      end
    end
  end
end