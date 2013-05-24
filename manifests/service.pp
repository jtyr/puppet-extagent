# This class manages the extagent service.
class extagent::service {

  # Decide whether to enable or disable the extagentd service
  if $extagent::enabled == 'true' {
    $ensure = 'running'
  } else {
    $ensure = 'stopped'
  }

  # Extagentd service setting
  service { 'extagentd' :
    ensure     => $ensure,
    enable     => $extagent::enabled,
    hasstatus  => true,
    hasrestart => true,
    name       => $extagent::service_name,
  }

}

# ex: set ts=2 et sw=2 filetype=puppet:
