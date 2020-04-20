class View

  Header = ["date || credit || debit || balance"]
  
  def show(statement, header = Header)
    @view_output = []
    @final = []
    @view_output << Header
  end
end