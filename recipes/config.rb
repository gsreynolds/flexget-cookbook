#
# Cookbook Name:: flexget
# Recipe:: config
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

begin
  config = data_bag_item('flexget', 'config')
rescue
  Chef::Log.warn("No 'flexget' data bag found.")
  config = []
end

user = node['flexget']['user']

if !user
  Chef::Log.warn('You must specify a user to configure FlexGet under.')
  return
end

home = node['etc']['passwd'][user]['dir']
config_dir = File.join(home, '.flexget')

directory config_dir do
  action :create
end

template File.join(config_dir, 'config.yml') do
  source 'config.yml.erb'
  owner node['flexget']['user']
  group node['flexget']['user']
  backup false
  mode 00644
  variables(
    :config => config['hash']
  )
  action :create
end
