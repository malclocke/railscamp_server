class apache {
  package {"apache2": }

  service {"apache2": }

  file {"/etc/apache/sites-available/default":
    source  => "puppet:///modules/apache/default",
    require => Package["apache2"],
    notify  => Service["apache2"],
  }
}
