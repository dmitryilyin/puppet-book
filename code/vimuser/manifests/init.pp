# = Определение: vimuser
#
# Создаёт тестового пользователя и конфигурационный файл vim
# в его домашнем каталоге.
#
# == Параметры: 
# 
# [*ensure*] Создать или удалить пользователя? [present, absent]
# [*groups*] Массив групп, в которые пользователь должен входить.
#
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
