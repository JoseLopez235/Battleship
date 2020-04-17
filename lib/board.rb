require_relative 'cell.rb'

class Board
  attr_accessor :cells
  def initialize
    @cells = {"A1" => "A1", "A2" => "A2", "A3" => "A3"}
  end

  def valid_coordinate?(coord)
    @cells.include?(coord)
  end

  def place(ship,coords)
    if valid_placement?
      coords.each do |ele|
        @cells[ele] = ship
      end
    end
  end

end
