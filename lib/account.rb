require_relative 'transactions'
require_relative 'statement'

class Account
  attr_reader :transactions, :statement

  def initialize(transactions, statement)
    @transactions = transactions
    @statement = statement
  end

  def deposit(amount)
    transactions.deposit(amount)
  end

  def withdraw(amount)
    transactions.withdraw(amount)
  end

  def show
    statement.view(transactions.transaction_history)
  end

end
