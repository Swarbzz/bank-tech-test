require_relative 'transaction'
require_relative 'statement'

class Account

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    update_transactions(amount)
  end

  def withdraw(amount)
    @balance -= amount
    update_transactions(-amount)
  end

  def balance
    @balance
  end

  def statement
    @statement.record
  end

  private

  def update_transactions(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.record << transaction
  end
end
