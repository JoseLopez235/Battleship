require "rspec/autorun"
require_relative "../lib/ship.rb"

describe Ship do
  it "should exist" do
    expect(Ship.new("cruiser", 3)).to be_kind_of(Ship)
  end
end
