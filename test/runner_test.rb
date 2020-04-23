require "rspec/autorun"
require_relative "../lib/runner.rb"

describe Runner do
  let(:runner) {Runner.new}

  xit "should exist" do
    expect(runner).to be_kind_of(Runner)
  end


  xit "should return true" do
    expect(runner.play).to eq(true)
  end
end
