class profile::base(
  $ntp_servers = [
    'hutta.0',
    'hutta.1',
  ],
  $file_owner = 'nobody',
) {
  include ::ssh
  class { '::ntp':
    servers            => $ntp_servers,
    service_hasrestart => true,
    config_file_owner  => $file_owner,
  }
  if $facts['os']['family'] == 'Redhat' {
    include ::profile::selinux
  }
}
