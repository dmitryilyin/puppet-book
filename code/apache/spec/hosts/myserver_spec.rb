require 'spec_helper'

describe 'myserver.example.com' do
  let(:node) { 'myserver.example.com' }
  let(:facts) { {
    :osfamily => 'RedHat',
    :operatingsystem => 'CentOS',
  } }

  it do
    should include_class('apache')
  end

  it do
    should contain_apache__site('mysite.ru')
  end

end
