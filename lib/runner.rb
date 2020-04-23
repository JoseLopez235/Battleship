class Runner

  attr_reader :play
  def initialize()
    @play = false
    main_menu
  end

  def main_menu
    puts "Welcome to BattleShip Would you like to play a match? \nY/N"
    answer = gets.chomp.downcase
    @play = true if answer == "y"
    main_menu if answer == "n"
  end
end
