# This class install extagent configuration files.
class extagent::config {

  # Clean up the mess from the previous installations
  exec { 'rm -f /etc/extagent/default/extagent_* /etc/extagent/default/extagentd* /etc/extagent/default/*.rpmsave /etc/extagent/default/*.rpmnew /etc/extagent/*.rpmsave /etc/extagent/*.rpmnew' :
    path        => '/usr/bin/:/bin/:/usr/sbin:/sbin',
    onlyif      => "test `ls -1 /etc/extagent/default/extagent_* /etc/extagent/default/extagentd* /etc/extagent/default/*.rpmsave /etc/extagent/default/*.rpmnew /etc/extagent/*.rpmsave /etc/extagent/*.rpmnew 2>/dev/null | wc -l` -gt 0",
  }

  # Use concat function
  Class {
    require => Class['concat::setup'],
  }

  # Main extagent config file concatation
  concat { $extagent::params::config_file :
    owner => 'root',
    group => 'root',
    mode  => '0400',
  }

  # Header of the concated file
  concat::fragment{ "${extagent::params::config_file}_global" :
    target  => $extagent::params::config_file,
    content => template("${module_name}/extagent.conf_header.erb"),
    order   => 10,
  }

  # Default file for extagent daemon
  extagent::module::default { 'Extagent daemon default extagent config file' :
    id => 'daemon',
  }

}

# ex: set et sw=2 ts=2 filetype=puppet:
