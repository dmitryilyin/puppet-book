require 'spec_helper'

describe 'abs' do
  it do
    should run.with_params('-1').and_return(1)
  end
end
