require "rspec/autorun"
require_relative "../lib/ai_brain.rb"
require_relative "../lib/board.rb"
<<<<<<< HEAD
=======
require_relative "../lib/cell.rb"
>>>>>>> d704b54d4fcf4ec2e6ac315ebcf02b5913c738b3
require_relative "../lib/ship.rb"

describe ArtificialIntelligence do
  let(:board) {Board.new}
<<<<<<< HEAD
=======
  let(:ai) {ArtificialIntelligence.new(board.cells)}
>>>>>>> d704b54d4fcf4ec2e6ac315ebcf02b5913c738b3
  let(:ship) {Ship.new("cruiser", 3)}

  it "should exist" do
    expect(ai).to be_kind_of(ArtificialIntelligence)
  end

  it "should return a random cell from the cell hash" do
    board.board
<<<<<<< HEAD
    board.place(ship,["A2", "B2", "C2"])
    ai.hunt_cell(board.cells)
=======
    board.place(ship, ["A1","A2","A3"])
    allow(ai).to receive(:rand) { 0 }
    allow(ai).to receive(:rand) { 0 }
    ai.hunt_cell
>>>>>>> d704b54d4fcf4ec2e6ac315ebcf02b5913c738b3

    expect(ai.hunt).to eq(board.cells["A1"])
    expect(ai.unused_cells.key?("A1")).to eq(false)
    expect(ai.hunt_cell).to eq(true)
  end

<<<<<<< HEAD
  # it "should return the adjacent cells if ship hit" do
  #   board.board
  #   ai.hunt = Cell.new("B2", ship)
  #
  #   expect(ai.adjacent_cells(board)).to eq([board.cells["A2"], board.cells["C2"], board.cells["B1"], board.cells["B3"]])
  # end
=======
  it "should return the adjacent cells if ship hit" do
    board.board
    ai.hunt = Cell.new("B2", ship)
>>>>>>> d704b54d4fcf4ec2e6ac315ebcf02b5913c738b3

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
