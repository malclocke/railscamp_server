class apt {

  package { "aptitude":
    ensure => present
  }

  exec { "aptitude_update":
    command     => '/usr/bin/aptitude update',
    refreshonly => true
  }
}
