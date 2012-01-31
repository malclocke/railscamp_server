define postgresql::sqlexec ($user = 'postgres', $unless = "/bin/false", $database = '', $sql = $name) {
  exec {"/usr/bin/psql --command \"$sql\" $database":
    user    => $user,
    unless  => $unless
  }
}
