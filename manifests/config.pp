class dropbox::config {

    file { "/etc/init.d/dropbox":
      ensure  => $logstash::ensure,
      source => 'puppet:///modules/dropbox/etc/init.d/dropbox.debian',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      notify  => Service['dropbox'],
    }

}
