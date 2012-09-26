# builddep.pp

define apt::builddep() {
  include apt::update

  exec { "apt-builddep-${name}":
    command   => "/usr/bin/apt-get -y --force-yes build-dep ${name}",
    logoutput => 'on_failure',
    require   => Anchor['apt::begin'],
    notify    => Class['apt::update'],
  }
}
