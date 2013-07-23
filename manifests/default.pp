import 'modules.pp'

exec { "apt-get update":
    path => "/usr/bin",
}

package{'vim':
  ensure => present,
}

class{'php':}
class{'apache':}
class { 'mysql::server':
  config_hash => { 'root_password' => 'bartosz15' }
}
class{'mysql::php':}
mysql::db { 'mydb':
  user     => 'user',
  password => 'password',
  host     => 'localhost',
  grant    => ['all'],
}

class{'git':}
class{'curl':}
class{'composer':}

class{'phpdoc':}
class{'phpqatools':}

class{'phing':}

#class{'phpmyadmin':}

file{'/var/www':
  ensure => link,
  target => '/vagrant'
}

file{'/vagrant/tests':
  ensure => directory,
}


