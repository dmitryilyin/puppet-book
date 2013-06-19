require 'spec_helper'

describe 'apache' do

  context 'freebsd' do
    let(:facts) { {
      :osfamily => 'FreeBSD',
      :operatingsystem => 'FreeBSD',
    } }

    it do
      expect {
        should contain_package('apache2')
      }.to raise_error(Puppet::Error, /Module apache is not supported on FreeBSD!/)
    end
  end

end
