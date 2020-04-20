require 'transaction'
require 'timecop'

describe Transaction do

  context 'New transaction' do
    describe '#initialize' do
      it 'makes a deposit' do
        Timecop.freeze do
          transaction = Transaction.new(5.00, 10.00)
          expect(transaction.amount).to eq 5.00
          expect(transaction.balance).to eq 10.00
          expect(transaction.date).to eq Time.now
        end
      end

      it 'makes a withdrawal' do
        Timecop.freeze do
          transaction = Transaction.new(-5.00, 5.00)
          expect(transaction.amount).to eq -5.00
          expect(transaction.balance).to eq 5.00
          expect(transaction.date).to eq Time.now
        end
      end
    end
  end
end