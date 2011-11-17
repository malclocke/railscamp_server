package {["vim", "netselect-apt"]:
  ensure => present
}

include dnsmasq
include apt
include ngircd

# The sources.list that ships with the vagrant box is no good, so just
# clobber it.
file { "/etc/apt/source.list":
  ensure => absent,
  notify => Exec["aptitude_update"]
}
apt::source { "nz":
  source => "deb http://ftp.nz.debian.org/debian squeeze main non-free contrib"
}
apt::source { "security":
  source => "deb http://security.debian.org/ squeeze/updates main contrib non-free"
}

# Set up a fake DNS entry
# dnsmasq::address { "www.foo.com":
#  address => '127.0.0.1'
# }
