require "rspec/autorun"
require_relative "../lib/cell.rb"

describe Cell do
  let(:cell) {Cell.new("B4")}
  it "should exist" do
    expect(cell).to be_kind_of(Cell)
  end

  it "should return ship's coordinate" do
    expect(cell.ship).to eq(nil)
  end
  
  it "should return the coordinate for the cell" do
    expect(cell.coordinate).to eq("B4")
  end

<<<<<<< HEAD
  it "should return true if ship got hit and false if not" do
    expect(cell.fired_upon?).to eq(false)
=======
  it "should return true if cell is empty" do
    expect(cell.empty?).to eq(true)
>>>>>>> 0e23bc654d9a894d92e8af390f6e4d9acefd590c
  end
end
