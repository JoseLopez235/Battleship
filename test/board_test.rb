require "rspec/autorun"
require_relative "../lib/board.rb"

describe Board do
  let(:board) {Board.new}

  it "should exist" do
    expect(board).to be_kind_of(Board)
  end

  it "should return the cells in the dictionary" do
    expect(board.cells).to eq({})
  end

  it "should return true if a cell is on the board" do
    expect(board.valid_coordinate?("A1")).to eq (true)
    expect(board.valid_coordinate?("A222")).to eq (false)
  end
end
