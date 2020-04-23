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

  xit "should return the cells in the dictionary" do
    expect(board.cells).to eq({})
  end

  it "should return true if a cell is on the board" do
    board.board

    expect(board.valid_coordinate?("A1")).to eq (true)
    expect(board.valid_coordinate?("A222")).to eq (false)
  end

  it "should return true if the placements are valid" do
    board.place(ship,["A1", "A2", "A3"])

    expect(board.valid_placement?(ship, ["D1", "D2", "D3"])).to eq(true)
    expect(board.valid_placement?(ship, ["B1", "C1", "D1"])).to eq(true)
    expect(board.valid_placement?(ship, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(ship, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(ship, ["A1", "B2", "C3"])).to eq(false)
  end

  it "should return cell dictionary with coordinate" do
    board.board

    expect(board.cells.keys.length).to eq(16)
  end

  it "should return the ship in the cell" do
    board.place(ship,["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to be_kind_of(Ship)
    expect(cell_2.ship).to be_kind_of(Ship)
    expect(cell_3.ship).to be_kind_of(Ship)
    expect(cell_1.ship).to eq(cell_3.ship)
  end

  it "should return board values." do
    board.board
    board.place(ship,["A1", "A2", "A3"])

    expect(board.board_render(board.cells)).to eq("\n      \n      [0, 0, 0, 0]}\n    ")
  end

  it "should return a string representation of S to show ships" do
    board.board
    board.place(ship,["A1", "A2", "A3"])

    expect(board.board_render(board.cells, true)).to eq("\n      \n      [0, 0, 0, 0]}\n    ")
  end
end
