define apt::source ($source, $ensure = present) {

  file { "/etc/apt/sources.list.d/$name.list":
    content => $source,
    ensure  => $ensure,
    notify  => Exec["aptitude_update"]
  }

}
