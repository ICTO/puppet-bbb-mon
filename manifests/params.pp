class bbbmon::params {
  $package = 'bbb-mon'
  $salt = 'secretsalt'
  $host = "http://${fqdn}"
  $factor_crit = 25
  $factor_warn = 20
  $limits = undef
}
