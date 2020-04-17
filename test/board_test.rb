require "rspec/autorun"
require_relative "../lib/board.rb"

describe Board do
  let(:board) {Board.new}

  it "should exist" do
    expect(board).to be_kind_of(Board)
  end

  xit "should return the cells in the dictionary" do
    expect(board.cells).to eq({})
  end

  it "should return true if a cell is on the board" do
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("A222")).to eq(false)
  end

  it "should return the ship in the cell" do
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.cells["A1"]).to eq(cruiser)
    expect(board.cells["A2"]).to eq(cruiser)
    expect(board.cells["A3"]).to eq(cruiser)
  end
end
