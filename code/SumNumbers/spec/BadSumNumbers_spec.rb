require 'spec_helper'
require './BadSumNumbers'

describe BadSumNumbers do
  it "should have zero sum to begin with" do
    sn = BadSumNumbers.new
    sn.sum.should == 0
  end
  it "should have given initial sum" do
    sn = BadSumNumbers.new(3)
    sn.sum.should == 3
  end
  it "should add every new number to the sum" do
    sn = BadSumNumbers.new
    sn.add(5)
    sn.sum.should == 5
  end
  it "should add all new numbers to initial sum" do
    sn = BadSumNumbers.new(2)
    sn.add(2)
    sn.sum.should == 4
  end
  it "should substract given value" do
    sn = BadSumNumbers.new(5)
    sn.sub(3)
    sn.sum.should == 2
  end
  it "should be positive if sum is more ther zero" do
    sn = BadSumNumbers.new(1) 
    sn.should be_positive
  end
  it "should not be positive if sum is lesser or equal zero" do
    sn = BadSumNumbers.new(-1) 
    sn.should_not be_positive
  end
end
