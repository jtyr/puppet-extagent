# This module configures the SNMP Extension agents.
class extagent (

    $enabled                          = hiera('extagent_enabled'),
    $ensure                           = hiera('extagent_ensure'),
    $oid_prefix                       = hiera('extagent_oid_prefix'),
    $package_version_dist             = hiera('extagent_package_dist'),
    $package_version_cert_expiry      = hiera('extagent_package_version_cert_expiry'),
    $package_version_cpu_summary      = hiera('extagent_package_version_cpu_summary'),
    $package_version_daemon           = hiera('extagent_package_version_daemon'),
    $package_version_dummy_simple     = hiera('extagent_package_version_dummy_simple'),
    $package_version_file_size        = hiera('extagent_package_version_file_size'),
    $package_version_http_statuscodes = hiera('extagent_package_version_http_statuscodes'),
    $package_version_java_elogging    = hiera('extagent_package_version_java_elogging'),
    $package_version_java_gc          = hiera('extagent_package_version_java_gc'),
    $package_version_java_statusfile  = hiera('extagent_package_version_java_statusfile'),
    $package_version_mysql_replstatus = hiera('extagent_package_version_mysql_replstatus'),
    $package_version_sendmail_stats   = hiera('extagent_package_version_sendmail_stats'),
    $package_version_table_maker      = hiera('extagent_package_version_table_maker')

) {

  anchor { 'extagent::begin' : } ~>
  class  { 'extagent::config' : }~>
  class  { 'extagent::service' : }~>
  anchor { 'extagent::end' : }

}

# ex: set ts=2 et sw=2 filetype=puppet:
