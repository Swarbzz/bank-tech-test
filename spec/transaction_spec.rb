require 'transaction'
require 'timecop'

describe Transaction do

  context 'New transaction' do
    describe '#initialize' do
      it 'makes a deposit' do
        Timecop.freeze do
          transaction = Transaction.new(5.00, nil, 10.00)
          expect(transaction.credit).to eq 5.00
          expect(transaction.debit).to eq nil
          expect(transaction.balance).to eq 10.00
          expect(transaction.date).to eq Time.now.strftime("%m/%d/%Y")
        end
      end

      it 'makes a withdrawal' do
        Timecop.freeze do
          transaction = Transaction.new(nil, 5.00, 5.00)
          expect(transaction.credit).to eq nil
          expect(transaction.debit).to eq 5.00
          expect(transaction.balance).to eq 5.00
          expect(transaction.date).to eq Time.now.strftime("%m/%d/%Y")
        end
      end
    end
  end
end
