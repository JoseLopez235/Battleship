require_relative 'ship.rb'
require_relative 'cell.rb'

class Board
  attr_accessor :cells
  def initialize(board_size=4)
    @cells = {}
    @board_size = board_size.to_i
    board
  end

  def board
    last_letter = "A"
    (@board_size - 1).times {last_letter.next!}
    letters = ("A"..last_letter)
    numbers = ("1"..@board_size.to_s)
    new_array = []

    letters.map do |ele|
      numbers.map do |ele_two|
        new_array << ele + ele_two
      end
    end

    new_array.each do |ele|
      @cells[ele] = Cell.new(ele)
    end
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
    variable_num = 1
    if valid_placement?(ship,coords)
      coords.each do |ele|
        @cells[ele].ship = ele
      end
    end

  end
end
