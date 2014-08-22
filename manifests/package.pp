class dropbox::package {
  Exec {
    path   => '/bin:/sbin:/usr/bin:/usr/sbin',
  }

  $download_arch = $::architecture ? {
    'i386'   => 'x86',
    'x86_64' => 'x86_64',
    'amd64'  => 'x86_64',
  }

  user { $dropbox::user:
    ensure     => 'present',
    managehome => 'true',
    comment    => 'Dropbox Service Account',
  }

  exec { 'download-dropbox':
    command => "wget -O /tmp/dropbox.tar.gz \"http://www.dropbox.com/download/?plat=lnx.${download_arch}\"",
    unless => 'test -d ~${dropbox::user}/.dropbox-dist',
    require => User[$dropbox::user],
  }

  exec { 'install-dropbox':
    command => "tar -zxvf /tmp/dropbox.tar.gz -C ~${dropbox::user}",
    unless => 'test -d ~${dropbox::user}/.dropbox-dist',
    require => Exec['download-dropbox'],
  }

  file { '/tmp/dropbox.tar.gz':
    ensure  => 'absent',
    require => Exec['install-dropbox'],
  }
}
