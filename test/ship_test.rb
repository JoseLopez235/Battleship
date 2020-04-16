require "rspec/autorun"
require_relative "../lib/ship.rb"

describe Ship do
  let(:ship) {Ship.new("cruiser", 3)}
  it "should exist" do
    expect(ship).to be_kind_of(Ship)
  end

  it "should return ship name" do
    expect(ship.name).to eq("cruiser")
  end

  it "should return length of ship" do
    expect(ship.length).to eq(3)
  end

  it "should return the ship health" do
    expect(ship.health).to be(3)
  end
end
