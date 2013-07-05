require 'spec_helper'

describe 'generate' do
  it do
    should run.with_params('/bin/echo', '-n', 'test').and_return('test')
  end
end
