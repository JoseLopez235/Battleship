require "rspec/autorun"
require_relative "../lib/start_game.rb"
require_relative "../lib/ship.rb"

describe StartGame do
  let(:start_game) {StartGame.new}
  let(:ship_one) {Ship.new("cruiser", 3)}

  xit "should exist" do
    expect(start_game).to be_kind_of(StartGame)
  end

  xit "should return generate a ship" do
    expect(start_game.generate_ships.length).to eq(2)
    expect(start_game.generate_ships[0]).to be_kind_of(Ship)
    expect(start_game.generate_ships[1]).to be_kind_of(Ship)
  end

  xit "should return true if coord is valid" do
    expect(start_game.valid_sequence?(ship_one, ["A1", "A2", "A3"])).to eq(true)
    expect(start_game.valid_sequence?(ship_one, ["Z1", "Z2", "Z3"])).to eq(false)
  end

  xit "should return a ship in a cell" do
    start_game.player_ship_placement(ship_one, ["A1", "A2", "A3"])

    expect(start_game.player.cells["A1"].ship).to eq(ship_one)
    expect(start_game.player.cells["A2"].ship).to eq(ship_one)
    expect(start_game.player.cells["A3"].ship).to eq(ship_one)
  end

  xit "should call player_ship_placement" do
    allow(start_game).to receive(:gets) { "A1 A2 A3" }
    expect(start_game).to receive(:player_ship_placement).with(ship_one, ["A1", "A2", "A3"])
    start_game.player_ship_input(ship_one)
  end

  it "should call player ship prompt and make shure a ship is placed" do
    start_game.player_ship_prompt
    
    expect(start_game.player.cells["A1"].ship).to be_kind_of(Ship)
    expect(start_game.player.cells["A2"].ship).to be_kind_of(Ship)
  end
end
