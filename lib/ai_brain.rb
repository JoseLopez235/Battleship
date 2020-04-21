require_relative 'board.rb'
require_relative 'ship.rb'

class ArtificialIntelligence
  attr_accessor :hunt
  def initialize
    @hunt = Cell.new("B2", Ship.new("cruiser", 3))
    @surroundcells = []
  end

  def hunt_cell(cells)
    values = cells.values
    @hunt = values[rand(values.size)]
  end

  def adjacent_cells(cells)
    if !@hunt.empty?
      get_vertical(cells)
      get_horizontal(cells)
    end
    return @surroundcells
  end

  def get_vertical(cells)
    huntcord = @hunt.coordinate
    top = (huntcord[0].ord-1).chr + huntcord[1].to_s
    bottom = (huntcord[0].ord+1).chr + huntcord[1].to_s
    @surroundcells << cells.cells[top] if cells.valid_coordinate?(top)
    @surroundcells << cells.cells[bottom] if cells.valid_coordinate?(bottom)
  end

  def get_horizontal(cells)
    huntcord = @hunt.coordinate
    left = huntcord[0] + ((huntcord[1]).to_i - 1).to_s
    right = huntcord.next
    @surroundcells << cells.cells[left] if cells.valid_coordinate?(left)
    @surroundcells << cells.cells[right] if cells.valid_coordinate?(right)
  end
end
