require 'spec_helper'

describe 'range' do
  it do
    should run.with_params('1', '5').and_return([1,2,3,4,5])
  end
end
