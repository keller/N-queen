#!/opt/local/bin/ruby1.9
class ChessBoard
  attr_reader :queens
  def initialize(size)
    @size = size
    @queens = []
  end
  
  def add_queen
    column = @queens.count
    return @queens if column==@size
    for row in 1..@size
      next if @queens.include?(row)
      #detect diags
      next if @queens.detect{|i|row-column+@queens.index(i) == i or row+column-@queens.index(i) == i} != nil
      @queens[column]=row;
      
      if add_queen == false
        @queens.delete_at(column)
        next
      else
        return true
      end
    end
    return false
  end
  
  def print_board
    puts '-'*(2*@size)+'-'
    for i in 1..@size
      column = @queens.index(i)
      puts '| '*column+'|x'+'| '*(@size-column)
    end
    puts '-'*(2*@size)+'-'
  end
end

board = ChessBoard.new(8)
board.add_queen
board.print_board
#p board.queens
