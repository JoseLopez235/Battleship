require "rspec/autorun"
require_relative "../lib/runner.rb"
require_relative "../lib/board.rb"
require_relative "../lib/ship.rb"

describe Runner do
  let(:runner) {Runner.new}

  xit "should exist" do
    expect(runner).to be_kind_of(Runner)
  end

  xit "should return true if Y in main menu" do
    expect(runner.play).to eq(true)
  end

  it "should return the board size" do
    expect(runner.choice_conversion).to eq(4)
  end

  xit "should return an array with ships" do
    expect(runner.ships[0]).to be_kind_of(Ship)
  end
end
