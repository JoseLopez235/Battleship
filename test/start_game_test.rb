require "rspec/autorun"
require_relative "../lib/start_game.rb"
require_relative "../lib/ship.rb"

describe StartGame do
  let(:start_game) {StartGame.new}

  it "should exist" do
    expect(start_game).to be_kind_of(StartGame)
  end

  it "should return a ship in a cell" do
    expect(start_game.generate_ships.length).to eq(2)
    expect(start_game.generate_ships[0]).to be_kind_of(Ship)
    expect(start_game.generate_ships[1]).to be_kind_of(Ship)
  end

  it "should return true if coord is valid" do
    expect(start_game.valid_sequence?("A1")).to eq(true)
    expect(start_game.valid_sequence?("Z9")).to eq(false)
  end
end
