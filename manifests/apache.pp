class profile::apache(
 Boolean $default_vhost = false,
 Hash $apache_vhost_servers,
 #Integer $port = 80,
 #String $docroot = '/var/www/test',
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }
  create_resources(::apache::vhost, $apache_vhost_servers)
  #::apache::vhost { 'shashiudawa6.mylabserver.com':
    #port          => 443,
    #docroot       => $docroot,
    #docroot_owner => 'nobody',
    #}
}
