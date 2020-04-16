require_relative 'ship.rb'

class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon_bool = false
  end

  def ship
    @ship
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end

  def fired_upon?
    @fired_upon_bool
  end

  def fire_upon

    end
  end
end
