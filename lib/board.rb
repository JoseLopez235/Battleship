require_relative 'ship.rb'

class Board
  attr_accessor :cells
  def initialize
    @cells = {}
  end

  def valid_placement?(ship, coords)
    if  coords.length == ship.length && vertically?(coords) || horizontally?(coords)
      return true
    end
    return false
  end

  def vertically?(coords)
    sorted_coords = coords.sort
    first_ele = sorted_coords[0]
    valid_coords = [first_ele]
    (coords.length - 1).times {valid_coords << valid_coords[-1].next}
    return valid_coords == sorted_coords
  end

  def horizontally?(coords)
    sorted_coords = coords.sort
    first_ele = sorted_coords[0]
    valid_coords = [first_ele]
    (coords.length - 1).times do
      valid_coords << valid_coords[-1][0].next + first_ele[1]
    end
    return valid_coords == sorted_coords
  end
end
