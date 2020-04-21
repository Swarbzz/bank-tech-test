class Transactions
  attr_reader :transaction_history, :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transaction_history = []
  end

  def deposit(amount)
    increase_balance(amount)
    confirm_deposit(amount)
  end

  def withdraw(amount)
    raise 'Insufficient Funds' if @balance < amount
    
    decrease_balance(amount)
    confirm_withdraw(amount)
  end

  private

  def confirm_deposit(amount)
    transaction = { 
      date: Time.now.strftime('%m/%d/%y'),
      credit: format('%.2f', amount),
      debit: '------',
      balance: format('%.2f', @balance)
    }
    @transaction_history.push(transaction)
  end

  def confirm_withdraw(amount)
    transaction = { 
      date: Time.now.strftime('%m/%d/%y'),
      credit: '------',
      debit: format('%.2f', amount),
      balance: format('%.2f', @balance)
    }
    @transaction_history.push(transaction)
  end

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end

end
