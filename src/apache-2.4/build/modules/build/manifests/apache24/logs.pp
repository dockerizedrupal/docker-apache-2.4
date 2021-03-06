class build::apache24::logs {
  require build::apache24::packages

  file { '/etc/apache2/conf-available/logs.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf-available/logs.conf',
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/logs.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/logs.conf',
    require => File['/etc/apache2/conf-available/logs.conf']
  }

  file { '/var/log/apache2/stdout.log':
    ensure => link,
    target => '/dev/stdout',
    force => true
  }

  file { '/var/log/apache2/stderr.log':
    ensure => link,
    target => '/dev/stderr',
    force => true
  }
}
