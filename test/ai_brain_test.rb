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

  it "should return the the array with out the cell if  moving a certain directions" do
    board.place(ship, ["A1","A2","A3"])
    ai.hunt = ai.cells["A1"]
    ai.surroundcells = [ai.cells["A2"], ai.cells["B1"]]
    ai.probable_coord(0, ai.cells["A2"] )

    expect(ai.surroundcells.include?("B1")).to eq(false)
  end

  it "should return opposite direction of the current hit" do
    ai.moving_direction = "up"
    ai.miss_hit

    expect(ai.moving_direction).to eq("down")
    expect(ai.move_succesful).to eq(false)
  end

  it "should return the corresponding direction" do
    expect(ai).to receive(:left_move)

    ai.moving_direction = "left"
    ai.determine_next_hit
  end

  it "should return all variables to there original state" do
    ai.reset_vars

    expect(ai.moving_direction).to eq(nil)
    expect(ai.previous_hits).to eq([])
    expect(ai.move_succesful).to eq(false)
    expect(ai.destroy).to eq(true)
  end

  it "should determine the next cell to hit" do
    board.place(ship, ["A1","A2","A3"])
    ai.hunt = ai.cells["A1"]
    ai.surroundcells = [ai.cells["A2"], ai.cells["B1"]]
    ai.determine_direction(ai.cells["A1"])

    expect(ai.surroundcells).to eq([ai.cells["A2"]])
  end

  it "should return the next hit that was fired upon" do
    board.place(ship, ["A1","A2","A3"])
    ai.surroundcells = [ai.cells["A2"], ai.cells["B1"]]
    ai.hunt = ai.cells["A1"]
    ai.moving_direction = "right"
    ai.previous_hits = [ai.cells["A1"]]

    expect(ai.calc_next_hit).to eq(ai.cells["A2"])
  end

  it "should return the next right cell to hit" do
    ai.hunt = ai.cells["A1"]
    ai.moving_direction = "right"
    ai.previous_hits = [ai.cells["A1"]]

    expect(ai.right_move).to eq(ai.cells["A2"])
  end

  it "should return the next right cell to hit" do
    ai.hunt = ai.cells["A3"]
    ai.moving_direction = "left"
    ai.previous_hits = [ai.cells["A3"]]

    expect(ai.left_move).to eq(ai.cells["A2"])
  end

  it "should return the next right cell to hit" do
    ai.hunt = ai.cells["C1"]
    ai.moving_direction = "up"
    ai.previous_hits = [ai.cells["C1"]]

    expect(ai.up_move).to eq(ai.cells["B1"])
  end

  it "should return the next right cell to hit" do
    ai.hunt = ai.cells["A1"]
    ai.moving_direction = "up"
    ai.previous_hits = [ai.cells["A1"]]

    expect(ai.down_move).to eq(ai.cells["B1"])
  end
end
