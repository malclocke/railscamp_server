class dnsmasq {
  package {"dnsmasq": ensure => present}

  service {"dnsmasq":
    ensure => running,
    require => Package["dnsmasq"]
  }

  file { "/etc/dnsmasq.conf":
    ensure  => present,
    content => template('dnsmasq/dnsmasq.conf.erb'),
    notify  => Service["dnsmasq"]
  }
}
