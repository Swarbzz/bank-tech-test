class Transaction
  attr_reader :credit, :balance, :date, :debit

  def initialize(credit, debit, balance)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = Time.now.strftime("%m/%d/%Y")
  end

end
