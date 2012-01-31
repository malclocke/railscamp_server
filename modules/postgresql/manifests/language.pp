define postgresql::language($database, $language = $name) {
  postgresql::sqlexec { "postgresql-create_language-$name-$database":
    database  => $database,
    sql       => "CREATE LANGUAGE '$language'",
    unless    => "/usr/bin/psql -tA -d $database --command \"SELECT lanname FROM pg_catalog.pg_language WHERE lanname = '$language'\" | grep -q ^$language",
  }
}
