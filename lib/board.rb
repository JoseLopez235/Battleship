class Board
  attr_accessor :cells
  def initialize
    @cells = {}
  end

  def valid_coordinate?(coord)
    @cells.include?(coord)
  end
end
