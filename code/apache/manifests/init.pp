class apache(
  $install = true,
) {

  if ($::osfamily == 'Redhat') {
    $package = 'httpd'
  } elsif ($::osfamily == 'Debian') {
    $package = 'apache2'
  } else {
    fail("Module ${module_name} is not supported on ${operatingsystem}!")
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
