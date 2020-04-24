require_relative "board.rb"
require_relative "ship.rb"

class StartGame
<<<<<<< HEAD
=======
  attr_accessor :player, :ai
>>>>>>> f101ab9d38787e617f4f234371a79edcdc4e1b26
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
<<<<<<< HEAD
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    user = gets.chomp
    # should end here if q
    until user.downcase == "p"
      return main_menu
    end
    # should call the computer_ship_place method and player_ship_prompt
    @player.computer_ship_place
    @player.player_ship_prompt
    # call main_menu
    main_menu
=======
    # should end here if q
    # should call the computer_ship_place method and player_ship_prompt
    # call main_menu
>>>>>>> f101ab9d38787e617f4f234371a79edcdc4e1b26
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

<<<<<<< HEAD
  def generate_ships(quantity=2, sizes=3)
    # quantity => 3, sizes => [2,3,3],
    # creates amount of ships told
  end

  def player_ship_input(ship)
    # ship => Ship class
    # gets input
    # if valid calls player_ship_placement
    # not valid calls player_ship_input(ship)
  end

  def player_ship_placement
    # actually creating the ship class and saving it in the board
  end

  def valid_sequence?
    # might take an argument
    #return true if not valid
  end

=======
  def generate_ships(quantity=2, sizes=[2,3])
    ships = []
    quantity.times { |i| ships << Ship.new(@name_of_ships[i], sizes[i])}
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


>>>>>>> f101ab9d38787e617f4f234371a79edcdc4e1b26
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
