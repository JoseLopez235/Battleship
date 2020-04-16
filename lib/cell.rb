class Cell
  attr_reader :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

<<<<<<< HEAD
  def empty?
    if @ship == nil
      return true
    else
      return false
    end
=======
  def ship
    return @ship
>>>>>>> d3e4d1d9aa62f1bd7bd31915f75048b2f98de104
  end
end
