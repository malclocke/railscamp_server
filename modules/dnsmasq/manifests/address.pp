# Use as follows
#
# dnsmasq::address { "www.fakedomain.com":
#   address => '10.9.8.7'
# }
define dnsmasq::address ($address, $ensure = 'present') {

  file { "/etc/dnsmasq.d/address-$name.conf":
    ensure  => $ensure,
    content => "address=/$name/$address",
    notify  => Service["dnsmasq"]
  }

}
