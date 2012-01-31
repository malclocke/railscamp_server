define apache::virtualhost($documentroot, 
                           $bindto = '*:80',
                           $servername = $name,
                           $serveraliases = false) {
  file {"/etc/apache2/sites-enabled/$name":
    #content => "<VirtualHost *:80>\nServerName $name\nDocumentRoot $documentroot\n</VirtualHost>\n",
    content => template('apache/virtualhost.erb'),
  }
}
