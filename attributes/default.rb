#
# Global logrotate settings
#

default['chef-client']['interval']                      = 3600
override['chef-client']['log_rotation']['postrotate']   = '/etc/init.d/chef-client restarrt >/dev/null || :'
default['timezone']                                     = '/usr/share/zoneinfo/US/Mountain'
default['logrotate']['global']['compress']              = true
default['logrotate']['global']['dateext']               = true
default['base']['excludes']                             = []
default['base']['includes']                             = []
default['sudo']['default_groups']                       = []
default['authorization']['sudo']['passwordless']        = true
default['authorization']['sudo']['include_sudoers_d']   = true

default['selinux']['mode']                              = 'permissive'
default['selinux']['type']                              = 'targeted'

default['base']['required_packages']                    = [ 'tar' ]

#
# chef-client.rb settings
#
default['chef-client']['config'] = {
  'node_name' => node['hostname']
}

default['collectd']['version']    = '5.5.3'
default['collectd']['url']        = "https://collectd.org/files/collectd-#{node['collectd']['version']}.tar.gz"
default['collectd']['packages']   = ['statsd']
default['collectd']['apache']     = nil
default['collectd']['plugins']    = Mash.new(
  'syslog' => {
    'config' => { 'LogLevel' => 'Info' }
  }
  'disk'      => { },
  'load'      => { },
  'swap'      => { },
  'memory'    => { },
  'cpu'       => { },
  'interface' => {
    'config'  => { 'Interface' => 'eth0', 'IgnoreSelected'  => false }
  },
  'network' => {
    'config'  => 'Server' => 'localhost' '8096' }
  },
  'stasd' => {
    'config'  => { 'Host' => '::', 'Port' => '8125', 'DeleteSets' => true, 'TimePercentile' => 90.0 }
  }
)
