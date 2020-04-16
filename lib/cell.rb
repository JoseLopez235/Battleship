class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def ship
    return @ship
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end
end
