class dropbox (
  $user = 'dropbox-user',
  ) {
  include stdlib

  anchor { 'dropbox::begin': }
  -> class { 'dropbox::package': }
  -> class { 'dropbox::config': }
  ~> class { 'dropbox::service': }
  -> anchor { 'dropbox::end': }
}
