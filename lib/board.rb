require_relative 'ship.rb'

class Board
  attr_accessor :cells
  def initialize
    @cells = {}
  end

  def valid_placement?(ship, coords)
    if  coords.length != ship.length
      return false
    elsif
    end
  end
end
