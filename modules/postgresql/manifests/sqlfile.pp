define postgresql::sqlfile ($database, $user = 'postgres',
                            $unless = "/bin/false") {
  exec {"/usr/bin/psql -f $name -d $database":
    user    => $user,
    unless  => $unless,
  }
}
