node default {}

node 'myserver.example.com' {
  class { 'apache' :}
  apache::site { 'mysite.ru' :}
}
