require "rspec/autorun"
require_relative "../lib/start_game.rb"
require_relative "../lib/ship.rb"
require_relative "../lib/cell.rb"
require_relative "../lib/board.rb"

describe StartGame do
  let(:start_game) {StartGame.new}
  let(:ship_one) {Ship.new("cruiser", 3)}

  it "should exist" do
    expect(start_game).to be_kind_of(StartGame)
  end

  it "should return generate a ship" do
    expect(start_game.generate_ships.length).to eq(2)
    expect(start_game.generate_ships[0]).to be_kind_of(Ship)
    expect(start_game.generate_ships[1]).to be_kind_of(Ship)
  end

  it "should return true if coord is valid" do
    expect(start_game.valid_sequence?(ship_one, ["A1", "A2", "A3"])).to eq(true)
    expect(start_game.valid_sequence?(ship_one, ["Z1", "Z2", "Z3"])).to eq(false)
  end

  it "should return a ship in a cell" do
    start_game.player_ship_placement(ship_one, ["A1", "A2", "A3"])

    expect(start_game.player.cells["A1"].ship).to eq(ship_one)
    expect(start_game.player.cells["A2"].ship).to eq(ship_one)
    expect(start_game.player.cells["A3"].ship).to eq(ship_one)
  end

  it "should return true if coord is valid and not been fired upon" do
    start_game.player.cells["A1"].place_ship(ship_one)
    start_game.player.cells["B1"].place_ship(ship_one)
    start_game.player.cells["A1"].fire_upon
    
    start_game.ai.cells["A1"].place_ship(ship_one)
    start_game.ai.cells["B1"].place_ship(ship_one)
    start_game.ai.cells["A1"].fire_upon

    expect(start_game.validate_hit?("A1")).to eq(false)
    expect(start_game.validate_hit?("B1")).to eq(true)
    expect(start_game.validate_hit?("Z1")).to eq(false)
  end

  it "should call player_ship_placement" do
    allow(start_game).to receive(:gets) { "A1 A2 A3" }
    expect(start_game).to receive(:player_ship_placement).with(ship_one, ["A1", "A2", "A3"])
    start_game.player_ship_input(ship_one)
  end

end
