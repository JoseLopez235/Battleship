require_relative "board.rb"
class Runner

  attr_reader :play, :board_size, :ships, :board
  def initialize()
    @board = nil
    @board_choice = nil
    @length_valid = false
    @used_coords = []
    @ships = []
    @coords = []
    @play = false
    @board_size = 4
    main_menu
    player_place_ship
    @board.board_render(@board.cells, true)
  end

  def player_place_ship
    @ships.each do |ele|
      valid_coords_loop = false
      puts "Enter #{ele.length} coordinates to enter #{ele.name}"
      @board.board_render(@board.cells, true)
      valid_user_coords(ele.length)

     while !valid_coords_loop do
       if @board.valid_placement?(ele, @coords)
        @board.place(ele, @coords)
        valid_coords_loop = true
        @coords.clear
       else
        puts "Invalid placement try different coords"
        @used_coords -= @coords
        @coords.clear
        valid_user_coords(ele.length)
        valid_coords_loop = true if @board.valid_placement?(ele, @coords)
       end
     end
    end
  end

  def valid_user_coords(ship_length)
    ship = ship_length
    ship.times do
      puts "Enter a valid coordinate"
      coord = gets.chomp.upcase
      if !@used_coords.include?(coord) && @board.valid_coordinate?(coord)
        @coords << coord
        @used_coords << coord
      else
        puts "try again"
        @coords.clear
        @used_coords.delete(coord)
        valid_user_coords((ship-1))
      end
    end
  end

  def main_menu
    puts "Welcome to BattleShip Would you like to play a match? \nY/N"
    answer = gets.chomp.downcase
    if answer == "y"
      @play = true
      custom_ships
    else
      main_menu
    end
  end

  def create_ships
    count = @board_choice + 1

    count.times do
      puts "what do you want to call the ship?"
      name = gets.chomp

      puts "what length will it be?"
      length = gets.chomp.to_i

      while !@length_valid do
        if valid_length?(length)
          @ships << Ship.new(name, length)
        else
          puts "input a valid length?"
          length = gets.chomp.to_i
        end
      end
      @length_valid = false
    end
  end

  def  valid_length?(length)
    if @board_choice == 1
      @length_valid = true if length <= 3 && 2 <= length
    else
      @length_valid = true if length <= @board_choice + 1 && 2 <= length
    end
  end

  def choice_conversion
    num = 4
    @board_size = num if @board_choice == 1
    (@board_choice-1).times do
      num += 2
    end
    @board_size = num
    @board = Board.new(@board_size)
    return @board_size
  end

  def custom_ships
    puts "would you like to change the board size?(default: 4X4) \n Y/N"
    answer = gets.chomp.downcase
    if answer == "y"
      puts board_table = """
        What board size do you want?(write the number)\n
          1.4X4 has 2 ships in total\n
          2.6X6 has 3 ships in total\n
          3.8X8 has 4 ships in total\n
          4.10X10 has 5 ships in total\n
          5.12X12 has 6 ships in total\n
          6.14X14 has 7 ships in total\n
          7.16X16 has 8 ships in total\n
          8.18X18 has 9 ships in total\n
          9.20X20 has 10 ships in total\n
          10.22X22 has 11 ships in total\n
          11.24X24 has 12 ships in total\n
          12.26X26 has 13 ships in total\n
          """
      while @board_choice == nil do
        puts "enter a valid number"
        valid_choice = gets.chomp.to_i
        @board_choice = valid_choice if 0 < valid_choice && valid_choice < 12
      end
    end
    choice_conversion
    create_ships
  end
end