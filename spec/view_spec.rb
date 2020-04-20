require 'view'

describe View do
  let(:transaction) { Transaction.new(5.00, "", 5.00) }
  let(:statement) { Statement.new }
  subject(:view) { described_class.new }

  context "View the Statement" do
    describe "#show" do
      xit "displays an empty balance" do
        statement.record << transaction 
        expect(view.show(statement)).to eq "date || credit || debit || balance"
      end
    end
  end
end