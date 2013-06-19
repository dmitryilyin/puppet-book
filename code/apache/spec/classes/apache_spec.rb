require 'spec_helper'

describe 'apache' do
  context 'ubuntu' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }
    it do
      should contain_package('apache2').with_ensure('installed')
    end

    context 'uninstall' do
      let(:params) { {
        :install => false,
      } }
      it do
        should contain_package('apache2').with_ensure('absent')
      end
    end

  end
    
  context 'centos' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }
    it do
      should contain_package('httpd').with_ensure('installed')
    end  

    context 'uninstall' do
      let(:params) { {
        :install => false,
      } }
      it do
        should contain_package('httpd').with_ensure('absent')
      end
    end

  end

end
