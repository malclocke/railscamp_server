package {["vim", "netselect-apt", "rubygems"]:
  ensure => present
}

package {["bundler", "rubygems-mirror"]:
  provider => gem,
  require => Package["rubygems"],
}

package {["libpq-dev", "libsqlite3-dev"]: }

include dnsmasq
include apt
include ngircd
include postgresql
include apache

# The sources.list that ships with the vagrant box is no good, so just
# clobber it.
file { ["/etc/apt/source.list", "/etc/apt/sources.list.d/backports.list"]:
  ensure => absent,
  notify => Exec["aptitude_update"]
}
apt::source { "nz":
  source => "deb http://ftp.nz.debian.org/debian squeeze main non-free contrib"
}
apt::source { "security":
  source => "deb http://security.debian.org/ squeeze/updates main contrib non-free"
}

postgresql::user { "vagrant":
  createdb  => true,
  password  => 'vagrant',
}

package {"libapache2-mod-passenger": }

apache::virtualhost {"twitter.com":
  serveraliases => "www.twitter.com twetter.com",
  documentroot  => "/vagrant/twetter/public",
}

apache::virtualhost {"railscamp.co.nz":
  serveraliases => "www.railscamp.co.nz",
  documentroot  => "/vagrant/ideagora/public",
}

# Set up a fake DNS entry
# dnsmasq::address { "www.foo.com":
#  address => '127.0.0.1'
# }
