class ngircd {

  package { "ngircd":
    ensure => present
  }

  service { "ngircd":
    ensure  => running,
    require => Package["ngircd"]
  }

  file { "/etc/ngircd/ngircd.motd":
    source  => "puppet:///modules/ngircd/ngircd.motd",
    owner   => irc,
    group   => irc,
    notify  => Service["ngircd"],
    require => Package["ngircd"]
  }
}
