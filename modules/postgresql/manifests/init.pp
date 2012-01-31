class postgresql {

  package { "postgresql-8.4":
    ensure => present,
  }

}
