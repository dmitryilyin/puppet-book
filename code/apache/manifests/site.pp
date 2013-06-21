# = Определение: apache::site
#
# Простое определение, которое показывает как создавать
# конфигурационные файлы для сайтов apache.
#
# == Параметры
#
# [*ensure*] Создать или удалить файл [present, absent]
#
define apache::site(
  $ensure = present,
) {
  if ($::osfamily == 'Debian') {
    file { "/etc/apache2/sites-available/${title}.conf" :
      ensure => $ensure,
    }
    if ($ensure == 'present') {
      file { "/etc/apache2/sites-enabled/${title}.conf" :
        ensure => 'link',
        target => "/etc/apache2/sites-available/${title}.conf",
      }
    } else {
      file { "/etc/apache2/sites-enabled/${title}.conf" :
        ensure => absent,
      }
    }
  } elsif ($::osfamily == 'RedHat') {
    file { "/etc/httpd/conf.d/${title}.conf" :
      ensure => $ensure,
    }
  }
}
