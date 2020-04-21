require 'transactions'

describe Transactions do
  subject(:transaction) { Transactions.new }
  let(:transactionOne) do
    { date: DATE, credit: '2000.00', debit: '------', balance: '2000.00' }
  end
  let(:transactionTwo) do
    { date: DATE, credit: '------', debit: '1500.00', balance: '500.00' }
  end
  DATE = Time.now.strftime('%m/%d/%y')

  describe '#initialize' do
    it 'default balance of 0' do
      expect(transaction.balance).to eq 0
    end
    it 'has no history' do
      expect(transaction.transaction_history).to eq []
    end
  end

  describe '#deposit' do
    it 'deposits funds' do
      transaction.deposit(100)
      expect(transaction.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it 'withdraws funds' do
      transaction.deposit(1000)
      transaction.withdraw(250)
      expect(transaction.balance).to eq 750
    end
    it 'raises an error if you try and withdraw funds you do not have' do
      expect { transaction.withdraw(1000) }. to raise_error "Insufficient Funds"
    end
  end

  describe '#transactions' do
    it 'records the history of a single transaction' do
      transaction.deposit(2000)
      expect(transaction.transaction_history).to include(transactionOne)
    end
    it 'records multiple transactions' do
      transaction.deposit(2000)
      transaction.withdraw(1500)
      expect(transaction.transaction_history).to include(transactionOne, transactionTwo)
    end
  end

end
