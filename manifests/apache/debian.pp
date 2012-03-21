class php::apache::debian inherits php::apache::common {

  $phpini = "/etc/php5/apache2/php.ini"
notify {"php::apache::debian":}
  package { "libapache2-mod-php5": ensure => present }
}
