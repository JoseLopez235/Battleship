require_relative 'board.rb'

class ArtificialIntelligence
  attr_accessor :hunt
  def initialize
    @hunt = nil
  end

  def hunt_cell(cells)
    values = cells.values
    @hunt = values[rand(values.size)]
  end
end
