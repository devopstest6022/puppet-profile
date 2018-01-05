class profile::nginx(
  #$ensure,
  #$package_name,
  #$config_dir,
  #$config_ensure,
  #$config_mode,
  #$config_owner,
  #$config_group,
  #$config_confd,
  #$config_log_dir,
  #$config_pid_file,
  #$service_name,
  #$service_ensure,
  #$service_pattern,
  #$service_enable,
  #$service_hasstatus,
  #$service_hasrestart,
  #$docroot,
  #$vhosts,
  #$config_vdir_enable = $facts['os']['family'] ? {
    # 'Debian' => $config_dir,
    #default  => undef,
    #},
    #$config_process_user = $facts['os']['family'] ? {
      #'Debian' => 'www-data',
      #default  => 'nginx',
      #},
      #$vhost_dir = $facts['os']['family'] ? {
        #'Debian' => "${config_dir}/sites-enabled",
        #default  => $config_confd,
        #},
        #Array $vhosts,
) {
  include ::nginx

  #$vhosts.each |$vhost| {
    ::nginx::vhost { $facts['fqdn']:
      #port           => $vhost['port'],
      #server_aliases =>$vhost['server_aliases'],
    }
}
