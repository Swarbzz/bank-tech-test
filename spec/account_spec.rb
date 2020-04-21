require './lib/account'

describe Account do
  subject(:account) { Account.new(transactions, statement) }
  let(:transactions) { double('transactions') }
  let(:statement) { double('statement') }

  describe '#initialize' do
    it 'creates a transactions' do
      expect(account.transactions).to eq(transactions)
    end
  end

  describe '#deposit' do
    it 'can deposity money into account' do
      allow(transactions).to receive(:deposit)
      account.deposit(5.00)
      expect(transactions).to have_received(:deposit)
    end
  end

  describe '#withdraw' do
    it 'can withdraw money from an account' do
      allow(transactions).to receive(:withdraw)
      account.withdraw(5.00)
      expect(transactions).to have_received(:withdraw)
    end
  end

  describe '#show' do
    before do
      allow(statement).to receive(:view)
      allow(transactions).to receive(:transaction_history)
    end

    it 'can view statements' do
      account.show
      expect(statement).to have_received(:view)
    end
    it 'can see the history of transactions' do
      account.show
      expect(transactions).to have_received(:transaction_history)
    end
  end
end
