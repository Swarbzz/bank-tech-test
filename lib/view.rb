class View

  Header = ["date || credit || debit || balance"]
  HeaderLength = [4,6,5,7]
  
  def show(statement, header = Header)
    @view_output = []
    @final = []
    @view_output << Header
    create_output(statement)
    add_space
    @final.join("\n")
  end
 
  private

  def create_output(statement)
    statement.each do |transaction|
      output = []
      output << transaction.date.strftime("%m/%d/%Y")
      output << credit(transaction.credit)
      output << debit(transaction.debit)
      output << "#{ '%.02f' % transaction.balance }"
      (0..HeaderLength.length-1).each do |i|
        HeaderLength[i] = output[i].length if output[i].length > HeaderLength[i]
      end
      @view_output << output
    end
  end

  def credit(amount)
    amount == "" ? "" : "#{'%.02f' % amount}"
  end

  def debit(amount)
    amount == "" ? "" : "#{'%.02f' % amount}"
  end

  def add_space
    @view_output.map do |transaction|
      i = 0
      output = []
      transaction.map do |data|
        output << data
        i += 1
      end
      @final << output.join(" || ")
    end
  end
  p @final
    
end