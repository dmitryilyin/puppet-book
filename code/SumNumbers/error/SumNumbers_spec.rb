require './SumNumbers'

describe SumNumbers do
  it "should have zero sum to begin with" do
    sn = SumNumbers.new
    sn.out.should == 0
  end
  it "should have given initial sum" do
    sn = SumNumbers.new(3)
    sn.out.should == 3
  end
  it "should add every new number to the sum" do
    sn = SumNumbers.new
    sn.add(2)
    sn.add(3)
    sn.out.should == 5
  end
  it "should add all new numbers to initial sum" do
    sn = SumNumbers.new(2)
    sn.add(2)
    sn.out.should == 4
  end
end
