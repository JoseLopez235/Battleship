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
    @player_attacks = []
    @ai_attacks = []
    @player_ship_counter = 0
    @ai_ship_counter = 0
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    user = nil
     loop do
       puts "Enter p to play. Enter q to quit."
       user = gets.chomp
       break if user == "q" || user == "p"
     end
     exit if user == "q"
     if user == "p"
       computer_ship_place
       player_ship_prompt
     end
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
    attack_coord = gets.chomp
    validate_hit?(attack_coord) ? player_attack(attack_coord) : player_turn
  end

  def player_attack(coord)
    @ai.cells[coord].fire_upon
    @player_attacks << coord
    player_display_info(coord)
    @ai_ship_counter += 1 if @ai.cells[coord].ship.sunk?
    if @ai_ship_counter == generate_ships.count
      puts "You Won!"
    else
      ai_turn
    end
  end

  def player_display_info(cell)
    return @player.cells[cell].render
  end

  def ai_display_info(cell)
    return @ai.cells[cell].render
  end

  def ai_turn
    values = @player.cells.values
    coord = values[rand(values.size)].coordinate
    @player.cells[coord].fire_upon
    @ai_attacks << coord
    ai_display_info(coord)
    @player_ship_counter += 1 if @player.cells[coord].ship.sunk?
    if @player_ship_counter == generate_ships.count
      puts "I Won!"
    else
      player_turn
    end
  end

  def validate_hit?(coord)
    player = @player.cells[coord]
    ai = @ai.cells[coord]
    return false if !@ai.cells.include?(coord) || !@player.cells.include?(coord)
    return false if @ai_attacks.include?(coord) || @player_attacks.include?(coord)
    return player.fired_upon? || ai.fired_upon? ? false : true
  end
end
