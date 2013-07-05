# = Класс: apache
#
# Демонстрационный класс, который устанавливает пакет ntp,
# создаёт конфигурационный файл и запускает службу ntp.
#
# == Параметры:
#
# [*install*] Устанавливать ли пакет? [true, false]
#
class apache(
  $install = true,
) {

  if ($::osfamily == 'Redhat') {
    $package = 'httpd'
  } elsif ($::osfamily == 'Debian') {
    $package = 'apache2'
  } else {
    fail("Module ${module_name} is not supported on ${::operatingsystem}!")
  }

  if ($install) {
    $ensure = 'installed'
  } else {
    $ensure = 'absent'
  }

  package { $package :
    ensure => $ensure,
  }

}
