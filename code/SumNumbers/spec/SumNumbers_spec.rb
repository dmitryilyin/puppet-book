require 'spec_helper'
require 'SumNumbers'

describe SumNumbers do
  it "должен иметь нулевую сумму, если не указана другая" do
    sn = SumNumbers.new
    sn.sum.should == 0
  end
  it "должен сначала иметь указанную при создании сумму" do
    sn = SumNumbers.new(3)
    sn.sum.should == 3
  end
  it "должен прибавлять к сумме каждое число" do
    sn = SumNumbers.new
    sn.add(5)
    sn.sum.should == 5
  end
  it "должен вычитать из суммы указанные числа" do
    sn = SumNumbers.new(5)
    sn.sub(3)
    sn.sum.should == 2
  end
  it "должен считаться позитивным, если сумма больше нуля" do
    sn = SumNumbers.new(1) 
    sn.should be_positive
  end
  it "не должен считаться позитивным, если сумма меньше или равна нулю" do
    sn = SumNumbers.new(-1) 
    sn.should_not be_positive
  end
end
