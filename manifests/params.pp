# This class provides parameters for all the other classes.
class extagent::params {

  # Install by default
  $extagent_ensure = 'installed'

  # Enable the service
  $extagent_enabled = 'true'

  # OID prefix
  $extagent_oid_prefix = '1.3.6.1.4.1.9999.9999'

  # Package dist string
  $extagent_package_dist = ".el${lsbmajdistrelease}"

  # Versions of Extagent RPM packages
  $extagent_package_version_cert_expiry      = '1.14-1'
  $extagent_package_version_cpu_summary      = '1.14-1'
  $extagent_package_version_daemon           = '1.14-1'
  $extagent_package_version_dummy_simple     = '1.14-1'
  $extagent_package_version_file_size        = '1.14-1'
  $extagent_package_version_http_statuscodes = '1.14-1'
  $extagent_package_version_java_elogging    = '1.14-1'
  $extagent_package_version_java_gc          = '1.14-1'
  $extagent_package_version_java_statusfile  = '1.14-1'
  $extagent_package_version_mysql_replstatus = '1.14-1'
  $extagent_package_version_sendmail_stats   = '1.14-1'
  $extagent_package_version_table_maker      = '1.15-1'

  # Service name
  $service_name = 'extagentd'

  # Concated file
  $config_file = '/etc/extagent/extagent.conf'

}

# ex: set ts=2 et sw=2 filetype=puppet:
