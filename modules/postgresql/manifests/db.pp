define postgresql::db ($owner = $user, $template = 'template0',
                       $is_template = false, $encoding = 'SQL_ASCII',
                       $user = 'postgres') {

  exec {"postgresql-createdb-$name":
    command => "/usr/bin/createdb -O $owner -E $encoding -T $template $name",
    user    => $user,
    unless  => "/usr/bin/psql -ltA | /bin/grep -q ^$name",
  }

  if $is_template {
    postgresql::sqlexec {"UPDATE pg_database SET datistemplate = TRUE WHERE datname = '$name'":
      require => Exec["postgresql-createdb-$name"],
      unless  => "/usr/bin/psql -tA --command \"SELECT datname FROM pg_database WHERE datname = '$name' AND datistemplate = TRUE\" | /bin/grep -q ^$name",
    }
  }
}
