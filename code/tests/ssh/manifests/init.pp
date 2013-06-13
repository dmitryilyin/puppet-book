class ssh($status = true) {

  if ($::osfamily == 'Debian') {
    $package = 'openssh-server'
    $service = 'ssh'
  }
  elsif ($::osfamily == 'RedHat') {
    $package = 'openssh-server'
    $service = 'sshd'
  }
  else {
    fail("Module ${module_name} is not supported on ${operatingsystem}!")
  }

  if ($status) {
    $ensure = 'running'
    $enable = true
  }
  else {
    $ensure = 'stopped'
    $enable = false
  }

  package { $package :
    ensure => installed,
  }

  service { $service :
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    hasstatus  => true,
  }

  Package[$package] -> Service[$service]

}
