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

  it "works on hash" do
    hash = SafeHash(Int32, String).new
    hash[1] = "bar"
    hash[1].should eq("bar")
  end

  it "works on array" do
    array = SafeArray(Int32).new
    array << 1
    array.first.should eq(1)
  end
end
