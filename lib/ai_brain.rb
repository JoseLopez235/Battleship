=begin
  Need to finish fixing hunt_cells and finsih logical strike
=end

require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'

class ArtificialIntelligence
  attr_accessor :hunt
  def initialize
    @hunt = nil
    @surroundcells = []
    @ship_cells = []
  end

  def hunt_cell(cells)
    values = cells.values
    random_cell = values[rand(values.size)]
    random_cell.fire_upon
    @hunt = random_cell if !random_cell.empty?
  end

  def adjacent_cells(cells)
    if !@hunt.empty?
      @surroundcells << get_vertical(cells)
      @surroundcells << get_horizontal(cells)
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

  # def logical_strike(cells)
  #   @surroundcells.map do |ele|
  #     ele.fire_upon
  #     if !ele.empty?
  #       @ship_cells << ele
  #     end
  #   end
  #   return @ship_cells
  # end
end
