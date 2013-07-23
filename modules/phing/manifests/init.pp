# Installs Phing.
#
# Requires:: https://github.com/experience/vagrant-puppet-php

class phing{
  $bin_path = '/usr/bin/'

  php::pear::discover { 'pear.phing.info': }

  php::pear::install { 'phing::install_phing':
    package => 'phing/phing',
    creates => '/usr/bin/phing',
    dependencies => 'true',
    require => Php::Pear::Discover['pear.phing.info'],
  }
}

