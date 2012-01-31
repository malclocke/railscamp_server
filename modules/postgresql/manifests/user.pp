define postgresql::user($password, $superuser = false, $createdb = false,
                        $createrole = false, $login = true, $inherit = true) {
  $superuser_sql = $superuser ? {
    true  => 'SUPERUSER',
    false => 'NOSUPERUSER',
  }
  $createdb_sql = $createdb ? {
    true  => 'CREATEDB',
    false => 'NOCREATEDB',
  }
  $createrole_sql = $createrole ? {
    true  => 'CREATEROLE',
    false => 'NOCREATEROLE',
  }
  $login_sql = $login ? {
    true  => 'LOGIN',
    false => 'NOLOGIN',
  }
  $inherit_sql = $inherit ? {
    true  => 'INHERIT',
    false => 'NOINHERIT',
  }
  postgresql::sqlexec {"CREATE USER $name PASSWORD '$password' $superuser_sql $createdb_sql $createrole_sql $login_sql $inherit_sql":
    unless  => "/usr/bin/psql -tA --command '\\du $name' | /bin/grep -q ^$name",
  }
}
