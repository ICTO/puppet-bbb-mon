# == Class: bbbmon
#
# Install the bbb-mon package and place the correct configuration
# for the package
#
# === Parameters:
#
# $salt::         Security salt requered for the connection to the server
#                 Default value here is the salt that is preconfigured upon
#                 installation of bbbmon
#
# $host::         Hostname for connection, this defualts to $fqdn
#
# $factor_crit::  Set a factor to determine the critical limit for meetings
#                 and participants. The actual limit depends on the number of 
#                 cores.
#
# $factor_warn::  Same as above but for warning level
#
# $limits::       Override above parameters and provide a custom limits value
#
# === Requires:
# Requires a packaged version of the bbb-mon scripts in your repository
#
# === Sample usage:
#
# Using all the defaults:
# include bbbmon
#
# Setting custom values for the config:
#
# class{'bbbmon':
#   salt   => 'supersecretsalt',
#   limits => '50,50,0,0:80,80,0,0';
# }
#


class bbbmon (
  $package = $bbbmon::params::package,
  $salt = $bbbmon::params::salt,
  $host = $bbbmon::params::host,
  $factor_crit = $bbbmon::params::factor_crit,
  $factor_warn = $bbbmon::params::factor_warn,
  $limits = $bbbmon::params::limits
) inherits bbbmon::params {

  class {'bbbmon::install':;} ~>
  class {'bbbmon::config':;}
}
