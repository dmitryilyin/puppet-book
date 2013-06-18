define vimuser(
  $ensure = 'present',
  $groups = [],
) {

  if !($ensure in [ 'present', 'absent' ]) {
    fail('Ensure must be present or absent!')
  }

  user { $title :
    ensure     => $ensure,
    groups     => $groups,
    managehome => true,
    membership => 'minimum',
  } 

  if ($ensure == 'present') {
    file { "/home/${title}/.vimrc" :
      ensure  => present,
      mode    => '0640',
      owner   => $title,
      group   => $title,
      content => template('vimuser/vimrc.erb'),
    }
    User[$title] -> File["/home/${title}/.vimrc"]
  }

}
