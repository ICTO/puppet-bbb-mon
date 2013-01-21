class bbbmon::install {

  package{ $::bbbmon::package:
    ensure => installed;
  }
}
