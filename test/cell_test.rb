require "rspec/autorun"
require_relative "../lib/cell.rb"
require_relative "../lib/ship.rb"

describe Cell do
  let(:cell) {Cell.new("B4")}
  let(:cell_two) {Cell.new("B3")}
  let(:cell_three) {Cell.new("B2")}
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

  it "should return a string with a dot" do
    expect(cell.render).to eq(".")
  end

  it "should return a string with an M." do
    cell.fire_upon

    expect(cell.render).to eq("M")
  end

  it "should return a string with an H." do
    cell.place_ship(ship)
    cell.fire_upon

    expect(cell.render).to eq("H")
  end

  it "should return a string with an S." do
    cell.place_ship(ship)

    expect(cell.render(true)).to eq("S")
  end

  it "should return a string with an X." do
    cell.place_ship(ship)
    cell_two.place_ship(ship)
    cell_three.place_ship(ship)
    cell.fire_upon
    cell_two.fire_upon
    cell_three.fire_upon

    expect(cell.render).to eq("X")
  end
end
