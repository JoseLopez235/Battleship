require_relative 'ship.rb'
require_relative 'cell.rb'

class Board
  attr_accessor :cells
<<<<<<< HEAD
  def initialize
    @cells = {"A1" => "A1", "A2" => "A2", "A3" => "A3"}
=======
  def initialize()
    @cells = {}
>>>>>>> 3e19a390c6ed2a516b965ab1a8c64b48879abac4
  end

  def valid_coordinate?(coord)
   @cells.include?(coord)
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

  def place(ship,coords)
    if valid_placement?
      coords.each do |ele|
        @cells[ele] = ship
      end
    else
      puts "Cant placement not valid"
    end
  end

end
