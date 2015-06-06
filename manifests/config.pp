class dropbox::config {

    file { "/etc/init.d/dropbox":
      ensure  => present,
      source => 'puppet:///modules/dropbox/etc/init.d/dropbox.debian',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      notify  => Service['dropbox'],
    }

    file { "/etc/default/dropbox":
      ensure  => present,
      content => template('dropbox/default.erb'),
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      notify  => Service['dropbox'],
    }

}
