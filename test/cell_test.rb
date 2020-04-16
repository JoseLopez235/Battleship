require "rspec/autorun"
require_relative "../lib/cell.rb"

describe Cell do
  let(:cell) {Cell.new("B4")}
  it "should exist" do
    expect(cell).to be_kind_of(Cell)
  end

  it "should return the coordinate for the cell" do
    expect(cell.coordinate).to eq("B4")
  end

  it "should return true if ship got hit and false if not" do
    expect(cell.fired_upon?).to eq(false)
  end
end
