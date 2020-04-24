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
    # welcome message
    # calls generate_ships
    # loop of the generate_ships to go in player ship input
    # calls player_ship_input
    # player or ai board
    # turn(player)
  end

  def generate_ships(quantity=2, sizes=[2,3])
    ships = []
    quantity.times { |i| ships << Ship.new(@name_of_ships[i], sizes[i])}
    return ships
  end

  def player_ship_input(ship)
    coords = gets.chomp.split(" ")
    if valid_sequence?(coords)
      player_ship_placement(ship, coords)
    else
      puts "Those are invalid coordinates. Please try again:"
      player_ship_input(ship)
    end
  end

  def player_ship_placement(ship, coords)
    coords.each { |coord| @player.cells[coord].place_ship(ship) }
  end

  def valid_sequence?(ship)
    return true
  end

  def player_turn
    # prompt input and validated immediately
    # not valid call player_turn again
    # valid hit
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
    # validates coord
  end

end
