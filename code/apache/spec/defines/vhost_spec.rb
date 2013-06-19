require 'spec_helper'

describe 'apache::site' do
  let(:title) { 'mysite.ru' }

  context 'ubuntu' do
    let(:facts) { {
      :osfamily => 'Debian',
      :operatingsystem => 'Ubuntu',
    } }

    it do
      should contain_file('/etc/apache2/sites-available/mysite.ru.conf')
    end

    it do
      should contain_file('/etc/apache2/sites-enabled/mysite.ru.conf').with({
        'ensure' => 'link',
        'target' => '/etc/apache2/sites-available/mysite.ru.conf',
      })
    end

  end

  context 'centos' do
    let(:facts) { {
      :osfamily => 'RedHat',
      :operatingsystem => 'CentOS',
    } }

    it do
      should contain_file('/etc/httpd/conf.d/mysite.ru.conf')
    end

  end

end
