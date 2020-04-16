class Ship
  attr_accessor :length
  attr_reader :name
  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def health
    @health
  end
end
