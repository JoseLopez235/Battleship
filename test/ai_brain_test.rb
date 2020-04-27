require "rspec/autorun"
require_relative "../lib/ai_brain.rb"
require_relative "../lib/board.rb"
require_relative "../lib/cell.rb"
require_relative "../lib/ship.rb"

describe ArtificialIntelligence do
  let(:board) {Board.new}
  let(:ai) {ArtificialIntelligence.new(board.cells)}
  let(:ship) {Ship.new("cruiser", 3)}

  it "should exist" do
    expect(ai).to be_kind_of(ArtificialIntelligence)
  end

  it "should return a random cell from the cell hash" do
    board.place(ship, ["A1","A2","A3"])
    allow(ai).to receive(:rand) { 0 }
    allow(ai).to receive(:rand) { 0 }
    ai.hunt_cell

    expect(ai.hunt).to eq(board.cells["A1"])
    expect(ai.unused_cells.key?("A1")).to eq(false)
    expect(ai.hunt_cell).to eq(false)
  end

  it "should return the adjacent cells if ship hit" do
    ai.hunt = Cell.new("B2", ship)

    expect(ai.adjacent_cells(board)).to eq([board.cells["A2"], board.cells["C2"], board.cells["B1"], board.cells["B3"]])
  end

it "should return true if move was move_succesful" do
    board.place(ship, ["A1","A2","A3"])
    ai.surroundcells = [ai.cells["A2"], ai.cells["B1"]]
    allow(ai).to receive(:rand) { 1 }
    ai.logical_strikes

    expect(ai.surroundcells.include?("B1")).to eq(false)
  end
end
