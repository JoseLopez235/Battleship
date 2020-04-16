require "rspec/autorun"
require_relative "../lib/cell.rb"
require_relative "../lib/ship.rb"

describe Cell do
  let(:cell) {Cell.new("B4")}
  let(:ship) {Ship.new("cruiser", 3)}
  it "should exist" do
    expect(cell).to be_kind_of(Cell)
  end

  it "should return ship's coordinate" do
    expect(cell.ship).to eq(nil)
  end

  it "should return the coordinate for the cell" do
    expect(cell.coordinate).to eq("B4")
  end

  it "should return true if ship got hit and false if not" do
    expect(cell.fired_upon?).to eq(false)
  end

  it "should return true if cell is empty" do
    expect(cell.empty?).to eq(true)
  end

  it "should return true if the cell is fired upon" do
    expect(cell.fire_upon).to eq(true)
  end

  it "should return place of ship" do
    expect(cell.place_ship(ship)).to eq(cell.ship)
  end

  it "should return the current ship health -1" do
    cell.place_ship(ship)
    cell.fire_upon

    expect(ship.health).to eq(2)
  end
end
