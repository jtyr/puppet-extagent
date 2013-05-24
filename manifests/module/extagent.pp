# This define allows to add configuration fragments into extagent config.
define extagent::module::extagent(

  $order   = 15,
  $id      = '',
  $enabled = 'false',
  $params  = {}

) {

  # Get the fragment only if the extagent is enabled
  if $enabled == 'true' {
    # Get the extagent fragment
    concat::fragment{ "${extagent::params::config_file}_fragment_${id}_${name}" :
      target  => $extagent::params::config_file,
      content => template("${module_name}/extagent.conf.erb"),
      order   => $order,
    }
  }

}

# ex: set et sw=2 ts=2 filetype=puppet:
