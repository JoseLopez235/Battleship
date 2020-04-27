require_relative 'board.rb'
require_relative 'ship.rb'
require_relative 'cell.rb'

class ArtificialIntelligence
  attr_accessor :hunt, :unused_cells, :cells, :move_succesful, :surroundcells
  def initialize(cells)
    @cells = cells
    @hunt = nil
    @moving_direction = nil
    @previous_hits = []
    @move_succesful = false
    @surroundcells = []
    @unused_cells = cells.dup
    @destroy = true
    @opposite_move = {
      "left" => "right",
      "right" => "left",
      "up" => "down",
      "down" => "up",
    }
  end

  def hunt_cell
    values = @unused_cells.values
    random_code = values[rand(values.size)]
    random_code.fire_upon

    @unused_cells.delete(random_code.coordinate)

    if !random_code.empty?
      @hunt = random_code
      @destroy = false
    end
  end

  def adjacent_cells(cells)
    if !@hunt.empty?
      get_vertical(cells)
      get_horizontal(cells)
    end
    return @surroundcells
  end

  def get_vertical(cells)
    huntcord = @hunt.coordinate
    top = (huntcord[0].ord-1).chr + huntcord[1].to_s
    bottom = (huntcord[0].ord+1).chr + huntcord[1].to_s
    @surroundcells << cells.cells[top] if cells.valid_coordinate?(top)
    @surroundcells << cells.cells[bottom] if cells.valid_coordinate?(bottom)
  end

  def get_horizontal(cells)
    huntcord = @hunt.coordinate
    left = huntcord[0] + ((huntcord[1]).to_i - 1).to_s
    right = huntcord.next
    @surroundcells << cells.cells[left] if cells.valid_coordinate?(left)
    @surroundcells << cells.cells[right] if cells.valid_coordinate?(right)
  end

  def logical_strikes
    if !@move_succesful
      rand_index = rand(@surroundcells.length)
      cur_hit = @surroundcells[rand_index]
      cur_hit.fire_upon
      return cur_hit.empty? ? @surroundcells.delete_at(rand_index) : hit_setup(cur_hit)
    end
    calc_next_hit
  end

  def hit_setup(cur_hit)
    if cur_hit.ship.sunk?
      return reset_vars
    end
    @move_succesful = true
    determine_direction(cur_hit)
    @previous_hits << cur_hit
    return cur_hit
  end

  def determine_direction(cur_hit)
    if @hunt.coordinate[0] == cur_hit.coordinate[0]
      @moving_direction = @hunt.coordinate[1] > cur_hit.coordinate[1] ? "left" : "right"
      @surroundcells = probable_coord(0, cur_hit)
    else
      @moving_direction = @hunt.coordinate[0] > cur_hit.coordinate[0] ? "up" : "down"
      @surroundcells = probable_coord(1, cur_hit)
    end
  end

  def probable_coord(index, cur_hit)
    @surroundcells.keep_if do |coord|
      @hunt.coordinate[index] == coord.coordinate[index] && cur_hit.coordinate != coord.coordinate
    end
  end

  def calc_next_hit
    next_hit = determine_next_hit
    next_hit.fire_upon
    @previous_hits << next_hit
    if next_hit.ship.sunk?
      reset_vars
    elsif next_hit.empty?
      miss_hit
    end
    return next_hit
  end

  def miss_hit
    @moving_direction = @opposite_move[@moving_direction]
    @move_succesful = false
  end

  def determine_next_hit
    case @moving_direction
    when "left"
      return left_move
    when "right"
      return right_move
    when "up"
      return up_move
    when "down"
      return down_move
    end
  end

  def left_move(cur_hit=@previous_hits[-1])
    @moving_direction = "left"
    next_hit = cur_hit.coordinate[0] << (cur_hit.coordinate[1].to_i - 1).to_s
    return right_move(@hunt) if !@cells[next_hit]
    return @cells[next_hit].fired_upon? ? right_move(@hunt) : @cells[next_hit]
  end

  def right_move(cur_hit=@previous_hits[-1])
    @moving_direction = "right"
    next_hit = cur_hit.coordinate.next
    return left_move(@hunt) if !@cells[next_hit]
    return @cells[next_hit].fired_upon? ? left_move(@hunt) : @cells[next_hit]
  end

  def down_move(cur_hit=@previous_hits[-1])
    @moving_direction = "down"
    next_hit = cur_hit.coordinate[0].next << cur_hit.coordinate[1]
    return up_move(@hunt) if !@cells[next_hit]
    return @cells[next_hit].fired_upon? ? up_move(@hunt) : @cells[next_hit]
  end

  def up_move(cur_hit=@previous_hits[-1])
    @moving_direction = "up"
    next_hit = (cur_hit.coordinate[0].ord - 1).chr << cur_hit.coordinate[1]
    return down_move(@hunt) if !@cells[next_hit]
    return @cells[next_hit].fired_upon? ? down_move(@hunt) : @cells[next_hit]
  end

  def reset_vars
    @moving_direction = nil
    @previous_hits = []
    @move_succesful = false
    @destroy = true
  end
end
