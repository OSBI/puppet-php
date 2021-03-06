class php::apache::common inherits php {
notify {"php::apache::common":}
#  augeas { "default php.ini settings":
#    context => "/files/${phpini}",
#    changes => [
#      "set PHP/allow_url_fopen Off",
#      "set PHP/expose_php Off",
#     "set PHP/enable_dl Off",
#    ],
#    notify => Service["apache"],
#  }

file { "/etc/php5/apache2/php.ini":
	ensure => present,
	content => template("php/php.ini.erb"),
	notify => Service["apache"],
	}
	
  apache::module { "php5":
    ensure => present,
    #require => Augeas["default php.ini settings"],
    require => File["/etc/php5/apache2/php.ini"],
  }
}
