require './lib/statement'

describe Statement do
  let(:transaction) { Transaction.new(5.00, nil, 10.00) }
  subject(:statement) { described_class.new }
  
  context 'New Statement' do
    describe '#initialize' do
      it 'is empty' do
        expect(statement.record).to eq []
      end
    end

    describe "creating a transaction" do
      it "a new transaction should be inside a statement" do
        statement.record << transaction
        expect(statement.record).to eq [transaction]
      end
    end
  end
end
