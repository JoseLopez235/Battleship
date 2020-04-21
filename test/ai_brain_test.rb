require "rspec/autorun"
require_relative "../lib/ai_brain.rb"
require_relative "../lib/board.rb"

describe ArtificialIntelligence do
  let(:ai) {ArtificialIntelligence.new}
  let(:board) {Board.new}

  it "should exist" do
    expect(ai).to be_kind_of(ArtificialIntelligence)
  end

  it "should return a random cell from the cell hash" do
    board.board
    ai.hunt_cell(board.cells)

    expect(board.cells.value?(ai.hunt)).to eq(true)
  end

end
