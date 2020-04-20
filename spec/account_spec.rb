require './lib/account'

describe Account do
  subject(:account) { described_class.new }

  context "New account" do
    describe "#Initialize" do
      it "has an empty balance" do
        expect(account.balance).to eq 0
      end
    end

    describe "#deposit" do
      it "can deposity money into account" do
      account.deposit(5.00)
      expect(account.balance).to eq 5.00
      end
    end
  end
  
end