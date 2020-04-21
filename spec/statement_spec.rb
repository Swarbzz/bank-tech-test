require './lib/statement'

describe Statement do
  subject(:statement) { described_class.new }

  let(:transaction_history) do
    [{ date: '04/21/20 ', credit:  format('%.2f ', 100), debit: "------ ", balance:  format('%.2f', 100) }, 
     { date: '04/22/20 ', credit:  "------ ", debit: format('%.2f ', 100), balance:  format('%.2f', 0) }]
  end

  describe '#view' do
    let(:view) do
      " Date      || Credit  || Debit   || Balance\n" \
      " 04/22/20  || ------  || 100.00  || 0.00\n" \
      " 04/21/20  || 100.00  || ------  || 100.00\n"
    end
    it 'shows the history' do
      expect { statement.view(transaction_history) }.to output(view).to_stdout
    end
  end
end
