require_relative "board.rb"
require_relative "ship.rb"

class StartGame
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
