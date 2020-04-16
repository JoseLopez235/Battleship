require_relative 'ship.rb'

class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon_bool = false
  end

  def fired_upon?
    @fired_upon_bool
  end
end
