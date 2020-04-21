require_relative 'transaction'
require_relative 'statement'
require_relative 'view'

class Account

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    update_transactions(amount, "")
  end

  def withdraw(amount)
    fail "Insufficient funds" if @balance < amount
    @balance -= amount
    update_transactions("", amount)
  end

  attr_reader :balance

  def statement(view = View.new)
    view.show(@statement.record)
  end

  private

  def update_transactions(credit = "", debit = "")
    transaction = Transaction.new(credit, debit, @balance)
    @statement.record << transaction
  end
end
