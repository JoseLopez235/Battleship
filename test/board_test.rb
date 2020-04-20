require "rspec/autorun"
require_relative "../lib/board.rb"
require_relative "../lib/ship.rb"
require_relative "../lib/cell.rb"

describe Board do
  let(:board) {Board.new}
  let(:ship) {Ship.new("cruiser", 3)}

  it "should exist" do
    expect(board).to be_kind_of(Board)
  end

  it "should return the cells in the dictionary" do
    expect(board.cells).to eq({})
  end

  it "should return the ship in the cell" do
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.cells["A1"]).to eq(cruiser)
    expect(board.cells["A2"]).to eq(cruiser)
    expect(board.cells["A3"]).to eq(cruiser)
  end

  it "should return true if a cell is on the board" do
    board.board_size

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

  it "should return cell dictionary with coordinate" do
    board.board_size

    expect(board.cells.keys.length).to eq(16)
  end
end
