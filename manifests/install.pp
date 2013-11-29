class kibana::install {
  $kibana_vhost = $kibana::kibana_vhost
  ensure_packages(["git"])
  vcsrepo {'/opt/kibana':
    ensure   => 'present',
    provider => 'git',
    source   => 'git://github.com/elasticsearch/kibana.git',
    revision => 'v3.0.0milestone4',
  }

  include apache
  apache::vhost { $kibana_vhost:
    port    => '80',
    docroot => '/opt/kibana/src'
  }
}
