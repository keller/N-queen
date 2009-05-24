#!/opt/local/bin/ruby1.9
class ChessBoard
  def initialize(size)
    @size = size
  end
  
  def add_queen(column,queens)
    if column>@size
      p queens
      return true
    end
    return true if column>@size
    for row in 1..@size
      next if queens.include?(row)
      #detect diags
      next if queens.detect{|i|row-column+queens.index(i) == i or row+column-queens.index(i) == i} != nil
      queens[column]=row;
      next if add_queen(column+1,queens) == false
    end
    return false
  end
  
end

board = ChessBoard.new(8)
p board.add_queen(0,[])
