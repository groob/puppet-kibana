class kibana::install {
  ensure_packages(["git"])
  vcsrepo {'/opt/kibana':
    ensure   => 'present',
    provider => 'git',
    source   => 'git//github.com/elasticsearch/kibana.git',
    revision => 'v3.0.0milestone4',
  }
}
