default['flexget']['user'] = nil
default['flexget']['cron'] = {
  'minute' => '*/30',
  'hour' => '*',
  'path' => nil,
  'mailto' => nil,
  'user' => default['flexget']['user']
}
default['flexget']['use_transmissionrpc'] = false
