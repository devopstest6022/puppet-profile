class profile::base(
  $ntp_servers = [
    'paka.0',
    'hutta.1',
  ],
  $config_file_owner = 'root',
) {
  include ::ssh
  class { '::ntp':
    servers            => $ntp_servers,
    service_hasrestart => true,
    config_file_owner  => 'usbmuxd',
  }
  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}
