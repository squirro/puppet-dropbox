class dropbox (
  # The user into which the Dropbox binary will be installed.
  $user = 'dropbox-user',
  # The user(s) for which Dropbox will be started. Specify multiple users to
  # run multiple Dropbox instances on one server.
  $instances = ['dropbox-user'],
  ) {
  include stdlib

  anchor { 'dropbox::begin': }
  -> class { 'dropbox::package': }
  -> class { 'dropbox::config': }
  ~> class { 'dropbox::service': }
  -> anchor { 'dropbox::end': }
}
