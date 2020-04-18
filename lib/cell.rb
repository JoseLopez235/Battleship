require_relative 'ship.rb'

class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon_bool = false
    @render = "."
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
    if fired_upon? == false && empty? == false
      @fired_upon_bool = true
      @ship.hit
    elsif fired_upon? == false && empty? == true
      @fired_upon_bool = true
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def render(show_ship=false)
    return "S" if ship && show_ship
    return "X" if ship && ship.sunk?
    return "H" if ship && fired_upon?
    return "M" if fired_upon?
    return "."
  end
end
