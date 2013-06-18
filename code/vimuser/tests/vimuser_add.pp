vimuser { 'user1' :
  ensure => present, 
}

vimuser { 'user2' :
  ensure => present, 
  groups => ['adm'],
} 
