require "rspec/autorun"
require_relative "../lib/board.rb"
require_relative "../lib/ship.rb"

describe Board do
  let(:board) {Board.new}
  let(:ship) {Ship.new("cruiser", 3)}

  it "should exist" do
    expect(board).to be_kind_of(Board)
  end

  it "should return the cells in the dictionary" do
    expect(board.cells).to eq({})
  end

  xit "should return true if a cell is on the board" do
    expect(board.valid_coordinate?("A1")).to eq (true)
    expect(board.valid_coordinate?("A222")).to eq (false)
  end

  it "should return true if the placements are valid" do
    expect(board.valid_placement?(ship, ["A1", "A2", "A3"])).to eq(true)
    expect(board.valid_placement?(ship, ["A1", "B1", "C1"])).to eq(true)
    expect(board.valid_placement?(ship, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(ship, ["A1", "A2", "A5"])).to eq(false)
    expect(board.valid_placement?(ship, ["A1", "B2", "C3"])).to eq(false)
  end
end
