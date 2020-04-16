require "rspec/autorun"
require_relative "../lib/cell.rb"

describe Cell do
  it "should exist" do
    expect(Cell.new("B4")).to be_kind_of(Cell)
  end
end
