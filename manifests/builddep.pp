# builddep.pp

define apt::builddep() {
  include apt::update

  exec { "apt-builddep-${name}":
    command   => "/usr/bin/apt-get -y --force-yes build-dep ${name}",
    logoutput => 'on_failure',
    notify    => Class['apt::update'],
  }
}
