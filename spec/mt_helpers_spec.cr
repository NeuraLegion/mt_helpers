require "./spec_helper"

describe MtHelpers do
  # TODO: Write tests

  it "works" do
    Synchronized(Array(String)).new
  end

  it "equals" do
    array_a = Synchronized(Array(String)).new(["bar"])
    array_b = Synchronized(Array(String)).new(["bar"])

    (array_a.equals?(array_b) { |x, y| x == y }).should eq(true)
  end
end
