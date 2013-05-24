# This define allows to add default extagent config files.
define extagent::module::default(

  $id     = '',
  $params = {},
  $ensure = present

) {

  # Make sure that the extagent class is loaded
  Class {
    require => Class['extagent'],
  }

  # List of extagent OID postfixes
  $oid_postfix_list = {
    'cert-expiry'      => '2',
    'cpu-summary'      => '6.1',
    'dummy-simple'     => '8.1',
    'file-size'        => '4.1',
    'http-statuscodes' => '1.1',
    'java-elogging'    => '5.2',
    'java-gc'          => '5.3',
    'java-statusfile'  => '5.1',
    'mysql-replstatus' => '7.1',
    'sendmail-stats'   => '3.1',
  }

  if ($ensure == 'absent') {
    $package_ensure = 'absent'
  } else {
    # Get package version
    $package_ensure = $id ? {
      cert-expiry          => "${extagent::package_version_cert_expiry}${extagent::package_version_dist}",
      cpu-summary          => "${extagent::package_version_cpu_summary}${extagent::package_version_dist}",
      dummy-simple         => "${extagent::package_version_dummy_simple}${extagent::package_version_dist}",
      daemon               => "${extagent::package_version_daemon}${extagent::package_version_dist}",
      file-size            => "${extagent::package_version_file_size}${extagent::package_version_dist}",
      http-statuscodes     => "${extagent::package_version_http_statuscodes}${extagent::package_version_dist}",
      java-elogging        => "${extagent::package_version_java_elogging}${extagent::package_version_dist}",
      java-gc              => "${extagent::package_version_java_gc}${extagent::package_version_dist}",
      java-statusfile      => "${extagent::package_version_java_statusfile}${extagent::package_version_dist}",
      mysql-replstatus     => "${extagent::package_version_mysql_replstatus}${extagent::package_version_dist}",
      sendmail-stats       => "${extagent::package_version_sendmail_stats}${extagent::package_version_dist}",
      table-maker          => "${extagent::package_version_table_maker}${extagent::package_version_dist}",
      default              => undef,
    }

    if ($package_ensure == undef) {
      fail("Unknown extagent '${id}'.")
    }
  }

  # Pick the right version
  $oid_postfix = $oid_postfix_list[$id]

  # Install the extagent package
  package { "extagent-${id}" :
    ensure  => $package_ensure,
    notify  => Service['extagentd'],
  }

  # Install the default extagent config file
  file { "/etc/extagent/default/extagent-${id}.conf" :
    ensure  => $ensure,
    content => template("${module_name}/default.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
    require => Package["extagent-${id}"],
    notify  => Service['extagentd'],
  }

}

# ex: set et sw=2 ts=2 filetype=puppet:
