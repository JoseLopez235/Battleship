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
end
