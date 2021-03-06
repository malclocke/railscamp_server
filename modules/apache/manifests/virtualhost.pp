define apache::virtualhost($documentroot, 
                           $bindto = '*:80',
                           $serveraliases = false) {

  file {"/etc/apache2/sites-enabled/$name":
    content => template('apache/virtualhost.erb'),
    notify  => Service["apache2"],
  }

}
