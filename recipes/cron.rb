#
# Cookbook Name:: flexget
# Recipe:: cron
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

cron_d 'flexget' do
  minute  node['flexget']['cron']['minute']
  hour    node['flexget']['cron']['hour']
  path    node['flexget']['cron']['path'] if node['flexget']['cron']['path']
  mailto  node['flexget']['cron']['mailto'] if node['flexget']['cron']['mailto']
  user    node['flexget']['cron']['user']
  command '/usr/local/bin/flexget execute'
end
