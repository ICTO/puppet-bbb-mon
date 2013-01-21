class bbbmon::config {

  $host = $::bbbmon::host
  $salt = $::bbbmon::salt

  if $::bbbmon::limits {
    $limits = $::bbbmon::limits
  } else {
    #limits is not defined, we calculate limits now base on the number of cpus
    $warning = $::bbbmon::factor_warn * $processorcount
    $critical = $::bbbmon::factor_crit * $processorcount

    $limits = "${warning},${warning},0,0:${critical},${critical},0,0"
  }

  file { '/etc/bbb-mon.ini':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('bbbmon/bbb-mon.erb');
  }

}
