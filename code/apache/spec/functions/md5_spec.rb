require 'spec_helper'

describe 'md5' do
  it do
    should run.with_params('test').and_return('098f6bcd4621d373cade4e832627b4f6')
  end
end
