define postgresql::sqlexec ($user = 'postgres',
                            $unless = "/bin/false",
                            $database = '') {
  exec {"/usr/bin/psql --command \"$name\" $database":
    user    => $user,
    unless  => $unless
  }
}
