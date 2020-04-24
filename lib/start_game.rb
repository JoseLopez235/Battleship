require_relative "board.rb"
require_relative "ship.rb"

class StartGame
  attr_accessor :player, :ai
  def initialize()
    @player = Board.new
    @ai = Board.new
    @name_of_ships = {
      2 => "submarine",
      3 => "cruiser",
    }
    main_menu
  end

  def main_menu
    # Welcome to Battleship Functionality
    # should end here if q
    # should call the computer_ship_place method and player_ship_prompt
    # call main_menu
  end

  def computer_ship_place
    # the actual complicated method.
  end

  def player_ship_prompt
    puts "\nI have laid out my ships on the grid.\nYou now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    generate_ships.each do |ele|
      puts "\nPlace the #{ele.name} which is #{ele.length} long"
      @player.board_render(@player.cells, true)
      player_ship_input(ele)
      system "clear"
    end
    @player.board_render(@player.cells, true)
    player_turn
  end

  def generate_ships(quantity=2, sizes=[2,3])
    ships = []
    quantity.times { |i| ships << Ship.new(@name_of_ships[sizes[i]], sizes[i])}
    return ships
  end

  def player_ship_input(ship)
    coords = gets.chomp.split(" ")
    if valid_sequence?(ship, coords)
      player_ship_placement(ship, coords)
    else
      puts "Those are invalid coordinates. Please try again:"
      player_ship_input(ship)
    end
  end

  def player_ship_placement(ship, coords)
    coords.each { |coord| @player.cells[coord].place_ship(ship) }
  end

  def valid_sequence?(ship, coords)
    valid = false
    coords.sort
    coords.each do |ele|
      valid = @player.cells.include?(ele) && @player.valid_placement?(ship, coords)
    end
    return valid
  end


  def player_turn
    # prompt input and validated immediately
    # not valid call player_turn again
    # valid hit
    attack_coord = gets.chomp
    validate_hit?(attack_coord) ? player_attack(attack_coord) : player_turn
  end

  def player_attack(coord)
    # record the attack
    # display_info
    # if won return you won
    # if hasnt won call ai_turn
  end

  def display_info(cell)
    # check miss or hit
    # check if sunk?
  end

  def ai_turn
    # record the attack
    # display_info
    # if won return you won
    # if hasnt won call player_turn
  end

  def validate_hit?(coord)
    player = @player.cells[coord]
    ai = @ai.cells[coord]
    return false if !@ai.cells.include?(coord) || !@player.cells.include?(coord)
    return player.fired_upon? || ai.fired_upon? ? false : true
  end
end
