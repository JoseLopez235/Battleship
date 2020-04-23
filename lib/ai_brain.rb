=begin
At this point in A.I were tring to create the smart approach for the
the A.I to play against the user. Right now we were able to separate the
surrounding coordinates with the ship. We need to make sure if the ship was sunk
immediately.
=end
require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'

class ArtificialIntelligence
  attr_accessor :hunt, :unused_cells
  def initialize(cells)
    @hunt = nil
    @surroundcells = []
    @unused_cells = cells.dup
    @destroy = true
  end

  def hunt_cell
    values = @unused_cells.values
    random_code = values[rand(values.size)]
    random_code.fire_upon

    @unused_cells.delete(random_code.coordinate)

    if !random_code.empty?
      @hunt = random_code
      @destroy = false
    end
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

  def logical_strikes
    ship_coord = []
    ship_coord << @hunt
    @surroundcells.each do |ele|
      ele.fire_upon
      ship_coord << ele if !ele.empty?
    end
    if @hunt.ship.sunk?
      @destroy = true

    end
  end
end
