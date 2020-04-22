require "rspec/autorun"
require_relative "../lib/ai_brain.rb"
require_relative "../lib/board.rb"
require_relative "../lib/ship.rb"

describe ArtificialIntelligence do
  let(:ai) {ArtificialIntelligence.new}
  let(:board) {Board.new}
  let(:ship) {Ship.new("cruiser", 3)}

  it "should exist" do
    expect(ai).to be_kind_of(ArtificialIntelligence)
  end

  it "should return a random cell from the cell hash" do
    board.board
    board.place(ship,["A2", "B2", "C2"])
    ai.hunt_cell(board.cells)

    expect(board.cells.value?(ai.hunt)).to eq(true)
  end

  # it "should return the adjacent cells if ship hit" do
  #   board.board
  #   ai.hunt = Cell.new("B2", ship)
  #
  #   expect(ai.adjacent_cells(board)).to eq([board.cells["A2"], board.cells["C2"], board.cells["B1"], board.cells["B3"]])
  # end

  # it "should hit cell from adjacent_cells method then logically attack the rest of the ship" do
  #   board.board
  #   ai.hunt = Cell.new("B2", ship)
  #   board.place(ship,["B2", "A2", "C2", "D2"])
  #   ai.adjacent_cells(board)
  #   ai.logical_strike(board)
  #
  #   expect(ai.ship_cells).to eq([board.cells["A2"], board.cells["C2"], board.cells["D2"]])
  # end
end
